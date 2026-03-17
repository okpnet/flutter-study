import 'package:flutter/material.dart';
import 'package:flutter_graphql/constants/graphql_constant.dart';
import 'package:flutter_graphql/edit_models/base/iedit_model.dart';
import 'package:flutter_graphql/exceptions/graphql/graphql_exception.dart';
import 'package:flutter_graphql/graphql/generated/staff.graphql.dart';
import 'package:graphql/client.dart';

GraphQLClientProvider clientProvider() =>
    GraphQLClientProvider(GraphqlConstants.endpoint);

enum MutationType { insert, update }

// This class provides a GraphQL client with a specified endpoint and timeout duration.
// It initializes the client with default policies for queries and mutations, ensuring that all operations fetch data from the network and handle errors appropriately.
// The `query` method allows you to execute GraphQL queries with a timeout mechanism, throwing a custom exception if the operation exceeds the specified duration.
final class GraphQLClientProvider {
  final String _url;
  final bool isHasura = false;

  late final Duration timeLimit;
  late final GraphQLClient client;

  Map<string

  GraphQLClientProvider(this._url, {int? timeLimit,isHasura = false}) {
    this.timeLimit = timeLimit != null
        ? Duration(seconds: timeLimit)
        : const Duration(seconds: GraphqlConstants.timeoutDurationInSeconds);
    client = _initialize();
  }

  GraphqlTimeoutException createTimeoutException(String operationType) {
    return GraphqlTimeoutException(
      message:
          'GraphQL $operationType timed out after ${timeLimit.inSeconds} seconds',
    );
  }

  Future<QueryResult> _mutation(MutationOptions options) async {
    return await client
        .mutate(options)
        .timeout(
          timeLimit,
          onTimeout: () => throw createTimeoutException('mutation'),
        );
  }

  Future<List<QueryResult>> _execute(List<(MutationType, MutationOptions)> values) async {
    if(isHasura){
      final insertOptions =Merge values.where((value) => value.$1 == MutationType.insert).map((e) => e.$2.variables.toString());
      final updateOptions =values.where((value) => value.$1 == MutationType.update).map((e) => e.$2.variables.toString()).toList();

      
    }

    //not hasura
    return await Future.wait(values.map((value) async {
      try{
        final result = await _mutation(value.$2);
      if (result.hasException) {
        if (value.$1 == MutationType.insert) {
          throw GraphqlInsertException(message: result.exception.toString());
        } else {
          throw GraphqlUpdateException(message: result.exception.toString());
        }
      }
      return result;
      } on GraphqlTimeoutException{
        rethrow;
      }
    }));
  }

  Future<List<QueryResult>> _executeHasura(List<IEditModel> values) async {
    final insertOptions =values.where((value) => value.isNew).map((e) => e.createInsertOptions().variables).toList();
    final updateOptions =values.where((value) => !value.isNew).map((e) => e.createUpdateOptions()).toList();
  
        final insertResults = await Future.wait(insertOptions.map((option) async {
          try{
            final result = await _mutation(option);
            if (result.hasException) {
              throw GraphqlInsertException(message: result.exception.toString());
            }
            return result;
          } on GraphqlTimeoutException{
            rethrow;
          }
        }));
  
        final updateResults = await Future.wait(updateOptions.map((option) async {
          try{
            final result = await _mutation(option);
            if (result.hasException) {
              throw GraphqlUpdateException(message: result.exception.toString());
            }
            return result;
          } on GraphqlTimeoutException{
            rethrow;
          }
        }));
  
        return [...insertResults, ...updateResults];
  }

  Future<QueryResult> query(QueryOptions options) async {
    Mutation$StaffEdit$insert_tests_info_staff
    return await client
        .query(options)
        .timeout(
          timeLimit,
          onTimeout: () {
            throw GraphqlTimeoutException(
              message:
                  'GraphQL query timed out after ${timeLimit.inSeconds} seconds',
            );
          },
        );
  }

  Future<QueryResult> save(MutationOptions options,{}) async {
    return await client
        .mutate(options)
        .timeout(
          timeLimit,
          onTimeout: () {
            throw GraphqlTimeoutException(
              message:
                  'GraphQL mutation timed out after ${timeLimit.inSeconds} seconds',
            );
          },
        );
  }

  GraphQLClient _initialize() {
    final httpLink = HttpLink(_url);
    client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.networkOnly, error: ErrorPolicy.all),
        mutate: Policies(
          fetch: FetchPolicy.networkOnly,
          error: ErrorPolicy.all,
        ),
      ),
    );
    return client;
  }
}


import 'package:flutter_graphql/constants/graphql_constant.dart';
import 'package:flutter_graphql/exceptions/GraphqlTimeoutException.dart';
import 'package:graphql/client.dart';

GraphQLClientProvider clientProvider() => GraphQLClientProvider(GraphqlConstants.endpoint);

class GraphQLClientProvider {
  final String  _url;
  late final Duration timeLimit;
  late final GraphQLClient client;

  GraphQLClientProvider(this._url,{int? timeLimit}) {
    this.timeLimit = timeLimit != null ? Duration(seconds: timeLimit) : const Duration(seconds: GraphqlConstants.timeoutDurationInSeconds);
    client = _initialize();
  }

  Future<QueryResult> query(QueryOptions options) async {
    return await client.query(options).timeout(timeLimit, onTimeout: () {
      throw GraphqlTimeoutException(message: 'GraphQL query timed out after ${timeLimit.inSeconds} seconds');
    });
  }

  

  GraphQLClient _initialize() {
    final httpLink = HttpLink(_url);
    client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.networkOnly,
          error: ErrorPolicy.all,
        ),
        mutate: Policies(
          fetch: FetchPolicy.networkOnly,
          error: ErrorPolicy.all,
        ),
      ),
    );
    return client;
  }
}
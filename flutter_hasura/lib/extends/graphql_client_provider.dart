import 'dart:io';

import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

class GraphQlClientProvider {
  late Client _client;
  Client get client => _client;

  void createClient({String? token}){
    final httpClient=HttpClient()
    final link = HttpLink();
    _client = Client(link: link);
  }

  GraphQLClientFactory(Stream<String?> tokenStream) {
    tokenStream.listen((token) {
      final link = HttpLink(
        'https://your-endpoint/graphql',
        defaultHeaders: {
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );
      _client = Client(link: link);
    });
  }
}
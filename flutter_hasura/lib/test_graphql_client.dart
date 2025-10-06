import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';


class TestGraphqlClient {
  late final Client _client;
  TestGraphqlClient(String jwtToken) {
    final link = HttpLink(
      'http://localhost:9002/graphql',
      defaultHeaders: {
        'Authorization': 'Bearer $jwtToken',
      },
    );

    _client = Client(link: link);
  }

  void listenEmployees() async {
    final request = GGetEmployeesReq();
    _client.request(request).listen((event) {
      final data = event.data;
      if (data != null) {
        print('Employee ID: ${data.employee?.id}');
      }
    });
  }

}
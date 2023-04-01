import 'package:http/http.dart' as http;

class Api {
  final http.Client client;

  Api(this.client);

  Future<bool> check() async {
    final response = await client.get(
      Uri.parse('check'),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to check');
    }
  }
}

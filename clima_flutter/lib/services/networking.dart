import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      print('status code 200');
      String data = response.body;

      return jsonDecode(data);
    } else {
      print('did not get the api key');
      print(response.statusCode);
    }
  }
}

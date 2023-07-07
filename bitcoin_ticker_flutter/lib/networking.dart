import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future<dynamic> getResponse(String url) async {
    http.Response conversionData = await http.get(Uri.parse(url));
    if (conversionData.statusCode == 200) {
      var decodedData = jsonDecode(conversionData.body);
      return decodedData;
    } else {
      print(conversionData.statusCode);
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future<double> getResponse(String url) async {
    http.Response conversionData = await http.get(Uri.parse(url));
    if (conversionData.statusCode == 200) {
      var decodedData = jsonDecode(conversionData.body);
      double price = decodedData['rate'];
      return price;
    } else {
      print(conversionData.statusCode);
      return 0.0;
    }
  }
}

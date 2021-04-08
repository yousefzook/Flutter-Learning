import 'package:http/http.dart' as http;
import 'dart:convert' as conv;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(this.url));
    if (response.statusCode == 200) {
      return conv.jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

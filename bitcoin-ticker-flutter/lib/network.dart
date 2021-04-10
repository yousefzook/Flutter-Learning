import 'package:http/http.dart' as http;

const kUrl = 'https://rest.coinapi.io/v1/exchangerate/';
const kApikey = '3F2AA49E-38A1-4923-812C-912A8DD484F9';

class NetworkModule {
  Future<String> requestRate(String from, String to) async {
    var url = Uri.parse(kUrl + '$from/$to?apikey=$kApikey');
    var response = await http.get(url);
    if(response.statusCode != 200) {
      return null;
    }
    return response.body;
  }
}

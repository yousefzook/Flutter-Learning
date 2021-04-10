import 'dart:convert' as cnv;

class JsonParser {
  double getRate(String json) {
    num rate = cnv.jsonDecode(json)['rate'];
    return rate.toDouble();
  }
}

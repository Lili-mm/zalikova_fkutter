import 'currency.dart';
import 'package:http/http.dart' as http;

class RemoteService{

  Future<List<Currency>?> getCurrency() async{
    var client = http.Client();
    var uri = Uri.parse('https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json =response.body;
      return currencyFromJson(json);
    }
  }
}
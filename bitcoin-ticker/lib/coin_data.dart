import 'constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String selectedFiat = 'USD';
  String selectedCrypto_ = 'BTC';

  void setCrypto(String crypto) {
    selectedCrypto_ = crypto;
  }

  Future<double> getCoinData() async {
    String fullURL = apiURL + selectedCrypto_ + '/' + selectedFiat;

    print(fullURL);

    http.Response rawResponse = await http.get(fullURL, headers: apiHeaders);

    var rawData = jsonDecode(rawResponse.body);

    return rawData['rate'];
  }
}

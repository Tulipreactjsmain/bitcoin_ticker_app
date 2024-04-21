import 'package:bitcoin_ticker_app/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiKey = dotenv.env['API_KEY'];
String coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class PriceModel {
  Future<dynamic> getCryptoTokenPrice(
      String tokenName, String currencyName) async {
    Uri url = Uri.parse('$coinApiUrl/$tokenName/$currencyName?apiKey=$apiKey');

    NetworkHelper networkHelper = NetworkHelper(url);
    var tokenData = await networkHelper.fetchData();
    return tokenData;
  }
}

import 'package:bitcoin_ticker_app/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bitcoin_ticker_app/utils/coin_data.dart';
import 'dart:async';

final apiKey = dotenv.env['API_KEY'];
String coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
Map<String, String>? coinPrice = {};
late Timer timer;
String selectedCurrency = "USD";

class PriceModel {
  Future<dynamic> getCryptoTokenPrice(
      String tokenName, String currencyName) async {
    Uri url = Uri.parse('$coinApiUrl/$tokenName/$currencyName?apiKey=$apiKey');

    NetworkHelper networkHelper = NetworkHelper(url);
    var tokenData = await networkHelper.fetchData();
    return tokenData;
  }

  Future<dynamic> getPrice(void Function(void Function()) setState) async {
    Future<void> updatePrice() async {
      PriceModel priceModel = PriceModel();
      for (String token in cryptoList) {
        var priceData =
            await priceModel.getCryptoTokenPrice(token, selectedCurrency);
        double rawPrice = priceData['rate'];
        String formattedPrice = rawPrice.toStringAsFixed(0);
        setState(() {
          coinPrice?[token] = formattedPrice;
        });

      }
    }

    await updatePrice();

    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) async {
      await updatePrice();
    });

    return coinPrice;
  }
}

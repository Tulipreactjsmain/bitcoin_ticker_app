import 'package:bitcoin_ticker_app/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bitcoin_ticker_app/utils/coin_data.dart';
import 'dart:async';

final apiKey = dotenv.env['API_KEY'];
String coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
Map<String, String>? coinPrice = {};
Timer? timer;

class PriceModel {
  Future<dynamic> getCryptoTokenPrice(
      String tokenName, String currencyName) async {
    Uri url = Uri.parse('$coinApiUrl/$tokenName/$currencyName?apiKey=$apiKey');

    NetworkHelper networkHelper = NetworkHelper(url);
    var tokenData = await networkHelper.fetchData();
    return tokenData;
  }

  Future<Map<String, String>?> getPrice(
      void Function(void Function()) setState, String currencyName) async {
    Future<void> updatePrice() async {
      PriceModel priceModel = PriceModel();
      for (String token in cryptoList) {
        var priceData =
            await priceModel.getCryptoTokenPrice(token, currencyName);
        if (priceData != null && priceData['rate'] != null) {
          double rawPrice = priceData['rate'];
          String formattedPrice = rawPrice.toStringAsFixed(0);
          setState(() {
            coinPrice?[token] = formattedPrice;
            // print(coinPrice);
          });
        }
      }
    }

    await updatePrice();

    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      await updatePrice();
    });

    return coinPrice;
  }
}

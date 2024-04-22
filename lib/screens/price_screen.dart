// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_app/components/dropdowns.dart';
import 'package:bitcoin_ticker_app/services/price.dart';
import 'package:bitcoin_ticker_app/utils/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? currencyName;

  getPrice(String currency) async {
    coinPrice = await PriceModel().getPrice(setState, currency);
    currencyName = currency;
    return coinPrice;
  }

  @override
  void initState() {
    getPrice('USD');
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cryptoList.map((token) {
                return Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      coinPrice?[token] != null
                          ? '1 $token = ${coinPrice?[token]} $currencyName'
                          : 'Loading...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? iosPicker((index) {
                    getPrice(currenciesList[index]);
                    currencyName = currenciesList[index];
                  })
                : androidDropdown((value) {
                    setState(() {
                      currencyName = value!;
                    });
                  }, currencyName),
          ),
        ],
      ),
    );
  }
}

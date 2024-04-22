import 'package:flutter/material.dart';
import 'package:bitcoin_ticker_app/utils/coin_data.dart';
import 'package:bitcoin_ticker_app/services/price.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker_app/utils/debouncer.dart';

DropdownButton<String> androidDropdown(
    void Function(String?) onChanged, String? selectedCurrency) {
  return DropdownButton<String>(
    value: selectedCurrency,
    items: currenciesList.map((String currency) {
      return DropdownMenuItem<String>(
        value: currency,
        child: Text(currency),
      );
    }).toList(),
    onChanged: (value) {
      onChanged(value);
    },
  );
}

CupertinoPicker iosPicker(void Function(int) onChanged) {
  final fixedExtentScrollController =
      FixedExtentScrollController(initialItem: 19);
  return CupertinoPicker(
    backgroundColor: Colors.transparent,
    itemExtent: 40.0,
    scrollController: fixedExtentScrollController,
    onSelectedItemChanged: (int selectedIndex) {
      debounce(() {
        onChanged(selectedIndex);
        timer?.cancel();
        coinPrice?.clear();
      }, const Duration(milliseconds: 1000));
    },
    children: currenciesList.map((String currency) {
      return Text(currency);
    }).toList(),
  );
}

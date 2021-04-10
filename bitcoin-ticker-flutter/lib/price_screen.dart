import 'package:bitcoin_ticker/json_parser.dart';
import 'package:bitcoin_ticker/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'dart:io' show Platform;

import 'coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  List<double> rates = List<double>.filled(cryptoList.length, 0);

  updateRates(String value) async {
    List<double> ratesTemp = List<double>.filled(cryptoList.length, 0);
    for (int i = 0; i < cryptoList.length; i++) {
      NetworkModule networkModule = NetworkModule();
      String json = await networkModule.requestRate(cryptoList[i], value);
      if (json != null) {
        JsonParser parser = JsonParser();
        ratesTemp[i] = parser.getRate(json);
      } else {
        ratesTemp[i] = -1;
      }
    }
    setState(() {
      selectedCurrency = value;
      rates = ratesTemp;
    });
  }

  @override
  initState() {
    updateRates(selectedCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: createColumnWidgets(),
      ),
    );
  }

  List<Widget> createColumnWidgets() {
    List<Widget> list = [];
    for (int i = 0; i < cryptoList.length; i++) {
      list.add(createCard(cryptoList[i], selectedCurrency, rates[i]));
    }
    list.add(
      Container(
        height: 150.0,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 30.0),
        color: Colors.lightBlue,
        child: Platform.isAndroid ? androidDropdownMenu() : iosPicker(),
      ),
    );
    return list;
  }

  Widget createCard(from, to, rate) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $from = ${rate != -1 ? rate.toStringAsFixed(2) : '"Err"'} $to',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget androidDropdownMenu() {
    List<DropdownMenuItem<String>> items = currenciesList
        .map<DropdownMenuItem<String>>(
          (String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ),
        )
        .toList();
    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        setState(() {
          updateRates(value);
        });
      },
    );
  }

  Widget iosPicker() {
    List<Text> items = currenciesList
        .map<Text>(
          (String value) => Text(
            value,
          ),
        )
        .toList();
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        setState(() {
          updateRates(currenciesList[value]);
        });
      },
      children: items,
    );
  }
}

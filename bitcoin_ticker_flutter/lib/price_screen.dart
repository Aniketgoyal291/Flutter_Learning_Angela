import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'networking.dart';

const apikey = 'BE8E9D5D-276B-4A42-8D28-FC6E66E7CE8F';
const url =
    'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=BE8E9D5D-276B-4A42-8D28-FC6E66E7CE8F';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'INR';
  double? exchangeRate;
  NetworkHelper network = NetworkHelper();

  // List<DropdownMenuItem<String>>? getDropdownItems() {
  //   List<DropdownMenuItem<String>> dropdownItems = [];
  //   for (String currency in currenciesList) {
  //     dropdownItems.add(
  //       DropdownMenuItem(
  //         value: currency,
  //         child: Text(currency),
  //       ),
  //     );
  //   }
  //   return dropdownItems;
  // }
  // List<Widget> getPickerList() {
  //   List<Widget> pickerList = [];
  //   for (String currency in currenciesList) {
  //     pickerList.add(Text(currency));
  //   }
  //   return pickerList;
  // }

  /// We could have used this method, but we used the ternary operator.
  // Widget getPicker() {
  //   if (Platform.isIOS) {
  //     return getIosList();
  //   } else {
  //     return getAndroidList();
  //   }
  // }

  Widget getIosList() {
    List<Widget> pickerList = [];
    for (String currency in currenciesList) {
      pickerList.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (int selectedIndex) {
        // this return's the index of the option selected.
        print(selectedIndex);
      },
      children: pickerList,
    );
  }

  Widget getAndroidList() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        getConversionRate(value);
        selectedCurrency = value;
      },
    );
  }

  void getConversionRate(String? currency) async {
    var conversionData = await network.getResponse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apikey');
    setState(() {
      exchangeRate = conversionData['rate'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $exchangeRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIosList() : getAndroidList(),
          ),
        ],
      ),
    );
  }
}

// // dropdown menu for android
// DropdownButton<String>(
// value: selectedCurrency,
// items: getDropdownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value;
// });
// },
// ),

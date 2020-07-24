import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData myCoinData = CoinData();

  int cryptoRate;

  List<Widget> screenWidgetList = [];

  String selectedDropdownCurrency = 'USD';

  // Methods
  List<DropdownMenuItem<String>> getDropdownMenuItems() {
    List<DropdownMenuItem<String>> dropdownMenuItemList = [];

    for (var currency in currenciesList) {
      dropdownMenuItemList.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return dropdownMenuItemList;
  }

  void buildWidgetList() async {
    screenWidgetList = [];
    for (var crypto in cryptoList) {
      await getCoinData(crypto);
      screenWidgetList.add(Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: ExchangeCard(
          btcRate: cryptoRate,
          selectedDropdownCurrency: selectedDropdownCurrency,
          selectedCryptoCurrency: crypto,
        ),
      ));
    }

    screenWidgetList.add(SizedBox(
      height: 150.0,
    ));

    screenWidgetList.add(Expanded(
      child: Container(
        height: 150.0,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 30.0),
        color: Colors.lightBlue,
        child: Center(
          child: DropdownButton(
            items: getDropdownMenuItems(),
            onChanged: (newValue) {
              setState(() {
                selectedDropdownCurrency = newValue;
                myCoinData.selectedFiat = newValue;
                buildWidgetList();
              });
            },
            value: selectedDropdownCurrency,
          ),
        ),
      ),
    ));
  }

  Future<void> getCoinData(String selectedCrypto) async {
    double temp = await myCoinData.getCoinData();
    myCoinData.setCrypto(selectedCrypto);

    setState(() {
      cryptoRate = temp.toInt();
    });
  }

  // Lifespan Methods
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      buildWidgetList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: screenWidgetList,
      ),
    );
  }
}

class ExchangeCard extends StatelessWidget {
  const ExchangeCard({
    Key key,
    @required this.btcRate,
    @required this.selectedDropdownCurrency,
    @required this.selectedCryptoCurrency,
  }) : super(key: key);

  final int btcRate;
  final String selectedDropdownCurrency;
  final String selectedCryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $selectedCryptoCurrency = $btcRate $selectedDropdownCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

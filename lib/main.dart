import 'package:flutter/material.dart';
import 'remote_service.dart';
import 'currency.dart';
import 'currency_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zalikova robota',
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}):super (key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int id;
  List<Currency>? currencies;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }
  late List<String> currenciesNames = currencies!.map((txt) => txt.txt).toList();
  late String? selected = currenciesNames[selectedid];
  late int selectedid = 0;
  getData() async {
    currencies = await RemoteService().getCurrency();

    if(currencies != null){
      setState(() {
        isLoaded = true;

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Currency selection"),
      ),
      body: Center(
        child: Row(

          children: [
            Container(
              margin: EdgeInsets.fromLTRB(650, 0, 75, 0),
              child: DropdownButton<String>(
                  value: selected,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: currenciesNames

                  .map((currency) =>
                      DropdownMenuItem(
                        value: currency,
                        child: Text(currency),
                        onTap: (){ selectedid = currenciesNames!.indexOf(currency);},
                      ))
                      .toList(),
                  onChanged: (String? item){Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                CurrencyPage(id: selectedid))); }
                  ,
              ),),


          ],
        ),
      ),);}}

import 'package:flutter/material.dart';
import 'currency.dart';
import 'remote_service.dart';

class CurrencyPage extends StatefulWidget {
  late int id;

  CurrencyPage({super.key,required this.id});
  @override
  _CurrencyPage createState() =>  _CurrencyPage(id: id);
}


class _CurrencyPage extends State<CurrencyPage> {
  late int id;

  _CurrencyPage({required this.id});
  List<Currency>? currency;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }
  getData() async {
    currency = await RemoteService().getCurrency();
    if(currency != null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Currency"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return  Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          currency![id].txt,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ), Text(" ",style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                      Text(
                          currency?[id].rate.toString() ??'',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      Text(
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          " грн"
                      ),
                    ],)
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),),

      ),
    );
  }
}
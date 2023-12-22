import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataPage extends StatefulWidget {
  const DataPage ({ Key? key }) : super(key: key);

  @override
  _State createState() => _State();
}


   
  
class _State extends State {
  

List _items=[];
Future<void> readJson()async{
  final String response =await rootBundle.loadString('donnees.json');
  final data=await json.decode(response);
  setState((){
    _items=data["items"];
    print("..... items ${_items.length}");
  });
}
    


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: (){
        readJson();
      }, child: Text("hello")),
    );
  }
}
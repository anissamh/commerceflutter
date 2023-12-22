import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';




class Home extends StatefulWidget{
  @override
  _Home createState()=>_Home();
  
  }



class _Home extends State {
   List _items=[];
    List<String> liste=[];
  @override
  void initState() {
    super.initState();
    readJson();
  }
 
Future<List> readJson()async{
  final String response =await rootBundle.loadString('donnees.json');
  final data=await json.decode(response);
  setState((){
    _items=data["items"];
    print("..... items ${_items.length}");
  });
  return _items;
}


  List<String> getUniqueCategories() {
    
    Set<String> categoriesSet = Set<String>();
    for (var item in _items) {
      categoriesSet.add(item['category']);
    }
    
   liste=categoriesSet.toList();
   print("aaaaaaaaaaaaaaaaaaaaaaaaaaa items ${liste}");
     return liste;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        leading: IconButton(
          icon:Icon( Icons.menu),
          onPressed: (){},
       ),
       elevation: 0,
       actions: [
         IconButton(
           onPressed:(){readJson();},
         icon: Icon(Icons.search)),
       ],
      ),
         body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                
                Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    children: [
                      ClipRRect(
                        
                        child:Image.asset("workstation.png",alignment: Alignment.topRight,scale: 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      Padding(padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign:TextAlign.center ,
                            text: const TextSpan(
                              text: "Get Yours",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 28
                              ),
                            ), 
                          ),
                          ElevatedButton(
                             
                            onPressed: (){},
                          child: Text("Buy now !",),
                          style: ButtonStyle(
                            shadowColor:MaterialStateProperty.all(Colors.grey), 
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            backgroundColor: MaterialStateProperty.all(Colors.orange),
                            shape:MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),) ,
            
                          ),
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),
                ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: 
                      Column(
                        children: [
                          SizedBox(
                             
                              height: 60,
                                  child: Container(
                                   
                                    child: ListView.builder(
                                     scrollDirection: Axis.horizontal,
                                     shrinkWrap: true,
                                      itemCount:getUniqueCategories().length,
                                                itemBuilder: (context, index) {
                                                    // print("bbbaaaaaaaaaaaaaaaaaaaaaaaaaaa items ${liste}");
                                                  return Container(
                                                   
                                                   padding: const EdgeInsets.only(left: 15, bottom: 10),
                                                    child: ElevatedButton(
                                                      //margin: EdgeInsets.all(8.0),
                                                      onPressed: () { },
                                                      child: Container(
                                                      
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                               liste[index],
                                                         style: TextStyle(fontSize: 16.0),
                                                                              
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                    ),
                                  ),
                               
                          
                              ),
                          
                          Row(
                          
                         // padding: const EdgeInsets.all(5),
                        
                          children: [
                             Container(
                      color: Colors.red,
                      child: Text("fedcsefc")

                    ),
                          ],

                          
                          
                          ) 
    
                        ],
                      ),
                    
                  ),
               
                    
              ],
            ),
          ),
          
         ),
           bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 20,),
              IconButton(icon: Icon(Icons.home), onPressed: () {},),
              IconButton(icon: Icon(Icons.message), onPressed: () {},),
              IconButton(icon: Icon(Icons.gif_rounded), onPressed: () {},),
              IconButton(icon: Icon(Icons.person), onPressed: () {},),
              SizedBox(width: 2,),
            ],
          ),
        )
    
    );
    
  }
}
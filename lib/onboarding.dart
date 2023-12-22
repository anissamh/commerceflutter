
import 'package:commerceapp/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onBoarding extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return SafeArea(
  child: IntroductionScreen(
    pages: [
      PageViewModel(
        title: 'bienvenue',
        body: 'bienvenue bienvenue bienvenue bienvenue bienvenue.',
        footer: ElevatedButton( child: Text("commencer"),onPressed: ()=>goToHome(context),),
            
        image: buildImage('assets/pc.png'),
        decoration: getPageDecoration(), 
      ),
       PageViewModel(
        title: 'bienvenue',
        body: 'bienvenue bienvenue bienvenue bienvenue bienvenue.',
        image: buildImage('assets/ecran.png'),
        decoration: getPageDecoration(),
        
      ),
       PageViewModel(
        title: 'bienvenue',
        body: 'bienvenue bienvenue bienvenue bienvenue bienvenue.',
        image: buildImage('assets/cables.jpg'),
        decoration: getPageDecoration(),
        
      ),
        PageViewModel(
        title: 'bienvenue',
        body: 'bienvenue bienvenue bienvenue bienvenue bienvenue.',
        image: buildImage('assets/serveurs.png'),
        decoration: getPageDecoration(),
        
      ),
         
    ],
    globalBackgroundColor: Colors.grey,
      showNextButton: true,
      done: Text('Lire',style: TextStyle(fontWeight: FontWeight.bold),),
      onDone: ()=>goToHome(context),
      showSkipButton:true ,
      skip: Text("skip"),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
  ),
  
  
  
  );
  }
//decoration des points du carroussel
DotsDecorator getDotDecoration()=> DotsDecorator(
  
color: Colors.blue,
size: Size(10,10),
activeSize: Size(22, 10),
activeShape: RoundedRectangleBorder(
borderRadius:BorderRadius.circular(24), 
),

);
void goToHome(context)=>Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (_)=>Home())
);

  Widget buildImage(String path)=>
  Center(child: Image.asset(path,width: 350,),);

  PageDecoration getPageDecoration()=>PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    bodyPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.orange,
  );

}
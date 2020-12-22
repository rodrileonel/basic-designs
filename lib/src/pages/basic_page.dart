import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  final _titleStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);
  final _subTitleStyle = TextStyle(fontSize: 16,color: Colors.grey);
  
  @override
  Widget build(BuildContext context) { 
    final _screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
            _image(),
            _title(_screen),
            _buttons(),
            _texto(),
            _texto(),
            _texto(),
            _texto(),
            _texto(),
            _texto(),
          ]
        ),
      ),
    );
  }
  Widget _title(Size screen) => SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Row( children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text('Aquel arbolito',style: _titleStyle,),
              SizedBox(height: 5,),
              Text('donde esta escrito tu nombre y el mio',style: _subTitleStyle,),
            ]
          ),
        ),
        SizedBox(width:5),
        Icon(Icons.star, color: Colors.red, size: 30,),
        SizedBox(width:5),
        Text('41',style: TextStyle(fontSize: 20),),
      ],),
    ),
  );

  Widget _buttons() => Container(
    padding: EdgeInsets.symmetric(horizontal:30,vertical:20),
    child: Row(children: [
      _action(Icons.phone, 'CALL'),
      _action(Icons.near_me, 'ROUTE'),
      _action(Icons.share, 'SHARE'),
    ],),
  );

  Widget _action(IconData icon, String texto) => Expanded(
    child: Column(children:[
      Icon(icon,color: Colors.blue,size: 35,),
      SizedBox(height:5),
      Text(texto, style: TextStyle(fontSize: 12,color: Colors.blue),),
    ],)
  );

  Widget _texto() => SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Text(
        'Enim exercitation Lorem consectetur ipsum magna est voluptate enim sint commodo. Ut ex exercitation fugiat Lorem. Nulla exercitation adipisicing voluptate deserunt aute aliqua ad dolor velit tempor. In ex exercitation dolore cupidatat ad cupidatat non deserunt consectetur dolor mollit. Esse adipisicing consectetur consectetur eiusmod. Nisi id occaecat occaecat amet in aliquip nulla mollit exercitation sunt elit.',
        style: TextStyle(fontSize: 16,color: Colors.black),
        textAlign: TextAlign.justify,)
    ),
  );

  Widget _image() => Container(
    width: double.infinity,
    child: Image(
      fit:BoxFit.cover, 
      image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/9/417/148/nature-landscape-lavender-sunset-wallpaper-preview.jpg'),
    ),
  );
}
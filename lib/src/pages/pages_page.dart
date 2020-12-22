import 'package:flutter/material.dart';

class PagesPage extends StatelessWidget {
  const PagesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: PageView(
      scrollDirection: Axis.vertical,
      children:[
        _page1(),
        _page2(context),
      ],
    ),
  );

  Widget _page1() => Stack(children: [
    _imagenFondo(),
    _content(),
  ],);
  
  Widget _imagenFondo() => Container(
    width: double.infinity,
    height: double.infinity,
    child: Image(image:AssetImage('assets/space.jpg'),fit: BoxFit.cover,)
  );

  Widget _page2(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightGreen,
      child: Center(
        child: RaisedButton(
          textColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal:30,vertical:15),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shape: StadiumBorder(),
          color: Colors.green,
          child: Text('Presioname',style: TextStyle(fontSize: 20)), 
          onPressed: () => Navigator.pushNamed(context, 'buttons'),
          ),
      ),
    );
  }

  Widget _content() => SafeArea(
    child: Center(child: Container(
      padding: EdgeInsets.symmetric(horizontal:40,vertical:40),
      child: Column(
        children: [
          _texto('11°'),
          _texto('Miercoles'),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, color: Colors.white,size: 70,)
        ],
      ),
    ),),
  );

  Widget _texto(String texto) => Text(
    texto,
    style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
    
  );
}
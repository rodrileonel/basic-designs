import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(children:[
      _background(context),
      SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            _head(),
            _table(context),
          ]),
        ),
      ),
    ]),
    bottomNavigationBar: Theme(
      data: Theme.of(context).copyWith(
        canvasColor:Color.fromRGBO(55,57,84,1),
        primaryColor: Colors.greenAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1),),
        ),
      ),
      child: BottomNavigationBar(items: [
        _itemNav(Icons.calendar_today),
        _itemNav(Icons.pie_chart_outlined),
        _itemNav(Icons.supervised_user_circle),
      ]),
    ),
  );

  BottomNavigationBarItem _itemNav(IconData icon) => BottomNavigationBarItem(
    icon: Icon(icon),
    title: Container() //me obliga a poner titulo pero si no quiero puedo usar un container vacio
  );

  Widget _background(BuildContext context) {

    final _screen = MediaQuery.of(context).size;

    final principal = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient:LinearGradient(
          //begin: Alignment.topCenter,
          //end: Alignment.bottomCenter,
          //FractionalOffset personaliza mas el gradiente
          begin: FractionalOffset(0, 0.5),
          end: FractionalOffset(0, 1),
          colors: [
            Color.fromRGBO(52,54, 101, 1),
            Color.fromRGBO(35,37, 57, 1),
          ]
        ),
      ),
    );

    final secondary = Transform.rotate(
      angle: -pi / 6.0,
      child: Container(
        //le pongo _screen.height * 0.4 a ambas porque quiero que sea un cuadrado
        width: _screen.height * 0.43,
        height: _screen.height * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
            begin: FractionalOffset(0, 1),
            end: FractionalOffset(1, 0),
            colors: [
              Colors.green,
              Colors.greenAccent,
            ]
          )
        ),
      ),
    );

    return Stack(children: [
      principal,
      Positioned(top:-90,left:-30,child: secondary),
    ],);
  }

  Widget _head() => Container(
    padding: EdgeInsets.symmetric(horizontal:30,vertical:20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Text('Titulo',style: TextStyle(fontSize:30,color:Colors.white,fontWeight:FontWeight.bold),),
      SizedBox(height: 10),
      Text('SubTitulo',style: TextStyle(fontSize:20,color:Colors.white,),)
    ]),
  );

  Widget _table(BuildContext context) => Table(
    children: [
      TableRow(children: [ 
        _item(context,Colors.blue,Icons.cached,'OPCION 1'),
        _item(context,Colors.red,Icons.access_alarm,'OPCION 2'),
      ]),
      TableRow(children: [ 
        _item(context,Colors.amber,Icons.data_usage,'OPCION 3'),
        _item(context,Colors.green,Icons.bubble_chart,'OPCION 4'),
      ]),
      TableRow(children: [ 
        _item(context,Colors.black,Icons.camera,'OPCION 5'),
        _item(context,Colors.orange,Icons.directions_bus,'OPCION 6'),
      ]),
    ],
  );

  Widget _table2() => Expanded(
    child: GridView.count(
      crossAxisCount: 2,
      children: List<Widget>.generate(16, (index) {
        return GridTile(
          child: Card(
            color: Colors.blue.shade200,
            child: Center(
              child: Text('tile $index'),
            )
          ),
        );
      }),
    ),
  );

  Widget _item(BuildContext context,Color color, IconData icon, String texto) {
    final _screen = MediaQuery.of(context).size;
    return Container(
      height: _screen.width *0.4,
      width: _screen.width *0.4,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:Color.fromRGBO(62, 66, 107, 0.8)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX:3,sigmaY:3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              SizedBox(height:5),
              CircleAvatar(
                radius: 30,
                child:Icon(icon,color: Colors.white,size: 30,),
                backgroundColor: color,
              ),
              Text(texto,style: TextStyle(color: color),),
              SizedBox(height:5),
            ]
          ),
        ),
      ),
    );
  }
}
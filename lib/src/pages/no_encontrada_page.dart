import 'package:flutter/material.dart';

class NoEncontradaPage extends StatelessWidget {
  const NoEncontradaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina no encontrada"),
      ),
      body: Center(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Error 404", style: TextStyle(fontSize: 40.0, color: Colors.redAccent[700])),
            Text("Pagina no encontrada", style: TextStyle(fontSize: 30.0)),
          ], 
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: (){
          Navigator.pop(context);
        }
      ),
    );
  }
}
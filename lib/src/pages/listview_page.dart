import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController  _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoElemento = 0;

  @override
  void initState() {
    super.initState();
    _agregar5();


    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _agregar5();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: _crearLista()
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int idx){

        final imagen = _listaNumeros[idx];

        return FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/500/400/?image=$imagen'),
          fadeInDuration: Duration(milliseconds: 200),
        );
      }
    );
  }

  void _agregar5(){

    for (var i = 0; i < 5; i++) {
      _listaNumeros.add(_ultimoElemento++);
    }

    setState(() {});

  }


}
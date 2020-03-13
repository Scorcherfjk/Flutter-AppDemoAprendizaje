import 'dart:async';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar5();
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // _agregar5();

        _fetchData();
      }
    });
  }

  @override
  void dispose() { 
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ]
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPaginaNueva,
      child: ListView.builder(
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
      ),
    );
  }

  Future<void> _obtenerPaginaNueva() async {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, (){
      _listaNumeros.clear();
      _ultimoElemento++;
      _agregar5();
    });
    return Future.delayed(duracion);
  }

  void _agregar5(){

    for (var i = 0; i < 5; i++) {
      _listaNumeros.add(_ultimoElemento++);
    }

    setState(() {});

  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() { });
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, respuestaHTTP );
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      duration: Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn
    );
    _agregar5();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }else{
      return Container();
    }
  }
}
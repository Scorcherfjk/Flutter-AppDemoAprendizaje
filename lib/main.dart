import 'package:flutter/material.dart';
 
import 'package:curso_udemy_v2/src/routes/routes.dart';
import 'package:curso_udemy_v2/src/pages/no_encontrada_page.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      initialRoute: "/",
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) => MaterialPageRoute( builder: (context) => NoEncontradaPage()),
    );
  }
}
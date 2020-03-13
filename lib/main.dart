import 'package:flutter/material.dart';
 
import 'package:curso_udemy_v2/src/routes/routes.dart';
import 'package:curso_udemy_v2/src/pages/no_encontrada_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es','ES')
      ],
      initialRoute: "home",
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) => MaterialPageRoute( builder: (context) => NoEncontradaPage()),
    );
  }
}
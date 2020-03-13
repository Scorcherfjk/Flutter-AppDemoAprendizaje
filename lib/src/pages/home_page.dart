import 'package:flutter/material.dart';

import 'package:curso_udemy_v2/src/providers/menu_provider.dart';
import 'package:curso_udemy_v2/src/utils/icono_string_util.dart';
import 'package:curso_udemy_v2/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        },
      );

  }

  List<Widget> _listaItems(List<dynamic> data,BuildContext context) {

    final List<Widget> opciones = [];
    data.forEach((opt){

      Widget temp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blueAccent
        ),
        onTap: (){

          Navigator.pushNamed(context, opt['ruta']);

          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );

          // Navigator.push(context, route );

        },
      );

      opciones..add(temp)
        ..add(Divider());
    });

    return opciones;
    

  }

}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Invisibilidad','Fuerza','Invulnerabilidad','Regeneración'];
  TextEditingController _inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputText(),
          Divider(),
          _crearInputEmail(),
          Divider(),
          _crearInputPassword(),
          Divider(),
          _crearInputDate(context),
          Divider(),
          _crearInputDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInputText() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text("${_nombre.length} caracteres"),
        hintText: 'Pepito',
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) => setState(() {
        _nombre = valor;
        }),
    );
  }

  Widget _crearInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text("${_email.length} caracteres"),
        hintText: 'email@example.com',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) => setState(() {
        _email = valor;
        }),
    );
  }

  Widget _crearInputPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text("${_password.length} caracteres"),
        hintText: 'P4sSw0rD',
        labelText: 'Password',
        suffixIcon: Icon(Icons.keyboard),
        icon: Icon(Icons.lock_outline),
      ),
      onChanged: (valor) => setState(() {
        _password = valor;
        }),
    );
  }

  Widget _crearInputDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento', //
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {

    DateTime picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      locale: Locale('es','ES')
      );
    
    if (picker != null) {
      setState(() {
        _fecha = DateFormat('dd/MM/yyyy').format(picker);
        _inputDateController.text = _fecha;
      });
    } 

  }

  List<DropdownMenuItem<String>> getOptionsDropdown(){

    List<DropdownMenuItem<String>> lista = List();

    _poderes.forEach((poder){

      lista.add(
        DropdownMenuItem(
          child: Text(poder),
          value: poder,)
      );

    });

    return lista;


  }

  Widget  _crearInputDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOptionsDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            }
          ),
        )
      ],
    );
  }


  Widget _crearPersona() {
    return ListTile(
      title: Text("Tu Nombre es: $_nombre"),
      subtitle: Text("Email : $_email"),
      trailing: Text(_opcionSeleccionada),
    );
  }
}

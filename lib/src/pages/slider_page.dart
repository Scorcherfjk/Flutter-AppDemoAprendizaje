import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 0.0;
  bool _bloquearSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearInputCheckBox(),
            _crearInputSwitch(),
            Expanded(
              child: _crearImage()
            ),
          ],
        ),
      )
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      // label: '$_valorSlider', // funciona junto con divisions
      // divisions: 20, // asi el salto es fijo (de 20 en 20)
      min: 0.0,
      max: 230.0,
      value: _valorSlider,
      onChanged: _bloquearSlider ? null : (opt){
        setState(() {
          _valorSlider = opt;
        });
      }
    );
  }

  Widget _crearInputCheckBox() {
    
    /*return Checkbox(
      value: _bloquearSlider,
      onChanged: (check){
        setState(() {
          _bloquearSlider = check;
        });
      }
    );*/

    return CheckboxListTile(
      title: Text("Deshabilitar Slider"),
      value: _bloquearSlider,
      onChanged: (check){
        setState(() {
          _bloquearSlider = check;
        });
      });

  }

  Widget _crearInputSwitch() {
    return SwitchListTile(
      title: Text("Deshabilitar Slider"),
      value: _bloquearSlider,
      onChanged: (check){
        setState(() {
          _bloquearSlider = check;
        });
      });
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage('https://www.stickpng.com/assets/images/580b57fbd9996e24bc43c017.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

}
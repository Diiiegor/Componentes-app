import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorslider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _crearCheckbox(),
              _crearSwitch(),
              Expanded(
                child: _crearImagen(),
              )
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Dimenciones de la imagen',
      value: _valorslider,
      max: 400.0,
      min: 10.0,
      onChanged: (_bloquearCheck)
          ? null
          : (value) {
              setState(() {
                _valorslider = value;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'http://4.bp.blogspot.com/-zCzzNWxVwmQ/UcJGl7WJttI/AAAAAAAAASE/uq5efDIRmNo/s1600/naruto7.png'),
      width: _valorslider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {


    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

}

import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

final List<String> opciones=['Uno','Dos','Tres','Cuatro','Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children:_crearItems(),
        children:_crearItemsCorta(),
      ),
    );
  }


  List<Widget> _crearItems(){

    List<Widget> lista =new List<Widget>();

    for (var opcion in opciones) {
      final tempWidget=ListTile(
        title: Text(opcion),
      );
      lista..add(tempWidget)
        ..add(Divider());
    }

    return lista;
  }


  List<Widget> _crearItemsCorta(){

      return opciones.map((String item){

          return Column(
            children: <Widget>[
              ListTile(
                title:Text(item),
                subtitle: Text('Esto es un subtitulo'),
                leading: Icon(Icons.access_alarms),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){},
                ),
              Divider()
            ],
          );

      }).toList();


  }


}   
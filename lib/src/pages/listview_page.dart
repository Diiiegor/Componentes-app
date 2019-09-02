import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _insloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body:Stack(
        children: <Widget>[
           _crearLista(),
           _crearLoading()
        ],
      ),
    );
  }



  Widget _crearLista() {
    return RefreshIndicator(
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, index) {
          final imagen = _listaNumeros[index] + 10;

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
      onRefresh:obtenerPagina1 ,
    );
  }


  Future<Null> obtenerPagina1() async {
      final duration = new Duration(seconds: 2);
       Timer(duration, (){
        _listaNumeros.clear();
        _ultimoItem++;
        _agregar10();
      });

      return Future.delayed(duration);
  }


  _agregar10() {
    for (int i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _insloading = true;
    setState(() {});

    return new Timer(Duration(seconds: 2), respuestahttp);
  }

  respuestahttp() {
    _insloading=false;

    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    _agregar10();
  }

  Widget _crearLoading(){
    if(_insloading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    }
    else{
      return Container();
    }
  }
}

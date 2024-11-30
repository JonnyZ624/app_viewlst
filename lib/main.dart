import 'package:app_listview/screens/listaExterna.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Miaplicacion());
}

class Miaplicacion extends StatelessWidget {
  const Miaplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Listaexterna(),
    );
  }
}


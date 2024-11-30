
import 'dart:convert';

import 'package:flutter/material.dart';

class Listalocal extends StatelessWidget {
  const Listalocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("LISTA LOCAL"),
          lista2(context),
        ],
      ),
    );
  }
}

Widget lista1(){
  return ListView(
    children: [
      ListTile(
        title: Text("Elemento 1"),
      ),
      ListTile(
        title: Text("Elemento 2"),
      ),
    ],
  );
}

//leer datos de forma local

Future <List> leerJsonLocal(context) async{
  final String jsonString = await DefaultAssetBundle.of(context).loadString("assets/data/crash.json");

  return json.decode(jsonString);
} 

Widget lista2(context){
  return FutureBuilder(future: leerJsonLocal(context), builder: (context, snapshot){
    if(snapshot.hasData){
      final data = snapshot.data!;
      return ListView.builder( itemCount: data.length ,itemBuilder: (context, index){
        final item = data[index];
        return ListTile(
          title: Text("${item['name']}"),
        );
      });
    }else{
      return Text("Data no enontrada");
    }
  });
}
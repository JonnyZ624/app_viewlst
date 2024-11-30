import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listaexterna extends StatelessWidget {
  const Listaexterna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("LISTA EXTRNA"),
          Expanded(child: lista("https://jritsqmet.github.io/web-api/crash.json")), 

        ],
      ),
    );
  }
}


//Crea una funcion para traer datos de forma externa
Future <List> leerJsonExterno(url)async{
  final response =await http.get(Uri.parse(url));
  if(response.statusCode == 200){
  return json.decode(response.body);
  }else{
    throw Exception("Error");
  }
}
Widget lista(url){
  return FutureBuilder(future: leerJsonExterno(url), builder: (context, snapshot){
    if(snapshot.hasData){
      final data = snapshot.data!;
      return ListView.builder( itemCount: data.length ,itemBuilder: (context, index){
        final item = data[index];
        return ListTile(
          title: Column(
            children: [
              Text("Hola"),
              Text("${item['name']}"),
              Image.network(item['image'], height: 200,)
            ],
          ),
        );
      } );
    }else{
      return Text("Data no encontrada");
    }
  });
}
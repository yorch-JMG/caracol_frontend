import 'package:caracol_frontend/models/evento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventoClientePage extends StatelessWidget {
  final Evento data;
  const EventoClientePage({Key? key,
                  required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(data.nombre != null){
      return Scaffold(
        appBar: AppBar(
          title: Text("Sale page"),
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: 54.0,
                padding: EdgeInsets.all(12.0),
                child: Text("Data passed to this page:",
                 style: TextStyle(fontWeight: FontWeight.w700))),
              Text(data.nombre.toString()),
              Text(data.descripcion.toString()),
              Text(data.fecha.toString()),
            ],
          ),
        ),
      );
    }
    else{
      return Scaffold(
          appBar:AppBar(
              title:Text("no hay datos")
          )
      );
    }
  }
}

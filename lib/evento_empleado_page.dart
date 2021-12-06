import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/sale_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventoEmpleadoPage extends StatelessWidget {
  final Evento data;
  const EventoEmpleadoPage({Key? key,
                  required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(data.nombre != null){
      return Scaffold(
          appBar: AppBar(
              title: Text(data.nombre.toString()),
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: 54.0,
                padding: EdgeInsets.all(12.0),
                child: Text("Datos del evento:",
                 style: TextStyle(fontWeight: FontWeight.w700))),
              Text(data.asistentes.toString()),
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

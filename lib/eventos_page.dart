import 'package:caracol_frontend/evento_cliente_page.dart';
import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/sale_page.dart';
import 'package:caracol_frontend/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class EventosClientesPage extends StatefulWidget {
  @override
  _EventosClientesPageState createState() => _EventosClientesPageState();
}

Future<List<Evento>> getEventos() async {
  var getAllEventosList = await Services.getAllEventsList();
  print(getAllEventosList);
  return getAllEventosList;
}

class _EventosClientesPageState extends State<EventosClientesPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        fixedSize: const Size(140, 50),
        primary: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)));
    return MaterialApp(
      title: ('Museo Caracol'),
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Museo Caracol'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Container(
                child: FutureBuilder(
              future: getEventos(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation:5,
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              Text(snapshot.data[index].noEvento, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EventoClientePage(
                                      data: snapshot.data[index])));
                            },
                            child: SizedBox(
                              width: 200,
                              height: 100,
                              child: Text(snapshot.data[index].nombre),
                            ),
                          ),
                        );
                      });
                } else {
                  return Container(
                    child: Center(
                      child: Text("Cargando..."),
                    ),
                  );
                }
              },
            )),
          )),
      //const MyStatefulWidget()),
    );
  }
}

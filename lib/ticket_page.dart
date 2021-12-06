import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/models/ticketForVisitante.dart';
import 'package:caracol_frontend/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketPage extends StatelessWidget {
  Future<Ticket> getTicketInfo() async {
    Future<Ticket> ticket = Services.getTicketForVisitante();
    print(ticket.toString());
    return ticket;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTicketInfo(),
        initialData: "Cargando...",
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print(snapshot.data.getNombreEvento());
          return Scaffold(
              body: SingleChildScrollView(
                  child: QrImage(
                        data: snapshot.data.nombreEvento,
                        version: QrVersions.auto,
                        size: 230.0,)
              )  
              
          );

        });
  }
}

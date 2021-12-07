import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/sale_page.dart';
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
      return MaterialApp(
        title: ("Museo Caracol"),
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
          body: Column(
            children: <Widget>[
              Container(
                height: 499,
                padding: EdgeInsets.all(12.0),
                child: Column(
                    children:[
                      Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                          child: 

                            Text("Descubre este evento:",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                                ))),

                      Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 12),
                          child: 
                            Text(data.nombre.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                                ))),

                          
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: 
                            Text("Asistentes:",
                                style: TextStyle(
                                color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: 
                            Text(data.asistentes.toString(),
                                style: TextStyle(
                                color: Colors.white,
                                ) 
                      )),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: 
                            Text("Descripcion:",
                                style: TextStyle(
                                color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )),
                      ),
                      Padding(
                          padding: EdgeInsets.all(12.0),
                          child: 
                            Text(data.descripcion.toString(),
                                style: TextStyle(
                                color: Colors.white,
                                ) 
                                ,),
                          
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: 
                            Text("Fecha:",
                                style: TextStyle(
                                color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )),
                      ),
                      Padding(
                          padding: EdgeInsets.all(12.0),
                          child: 
                            Text(data.fecha.toString(),
                                style: TextStyle(
                                color: Colors.white,
                                ) 
                      )),
                      Padding(
                          padding: EdgeInsets.all(12.0),
                          child:
                            ElevatedButton(
                              onPressed: () =>{
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalePage(noEvento : data.getNoEvento())))
                  },
                              child: Text("Consigue tu boleto"))

                      )
                    ]
                )
                
                  
              ),
            ],
          ),
        ),
      ));
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

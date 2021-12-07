import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/models/material.dart';
import 'package:caracol_frontend/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventoEmpleadoPage extends StatefulWidget {
  final Evento data;
  EventoEmpleadoPage({Key? key,
                  required this.data,
  }) : super(key: key);
  @override
  _EventoEmpleadoPageState createState() => _EventoEmpleadoPageState();
}


  class _EventoEmpleadoPageState extends State<EventoEmpleadoPage> {
  
  Future<List<Material1>> listaMateriales(int idEvento) async{
  var getAllMaterialesList = await Services.getMaterialesPorEvento(idEvento);
  print(getAllMaterialesList);
  return getAllMaterialesList;
    
  }
  Future<String> eliminarMaterial(int idMaterial) async{
    var eliminarMaterial = await Services.deleteMaterial(idMaterial);
    print(await eliminarMaterial);
    return eliminarMaterial;
  }

  @override
  Widget build(BuildContext context) {
    if(widget.data.nombre != null){
      return Scaffold(
          appBar: AppBar(
              title: Text(widget.data.nombre.toString()),
        ),
        body: Container(
            child: FutureBuilder(
                future: listaMateriales(widget.data.noEvento),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(snapshot.data != null){
                            return ListView.builder( itemCount: snapshot.data.length,
                                              itemBuilder: (BuildContext context, int index){
                                                return Card(
                                                    child: InkWell(
                                                        splashColor: Colors.blue.withAlpha(30),
                                                        onTap: (){
                                                          print(snapshot.data[index].idMaterial);
                                                          print(snapshot.data[index].tipo);
                                                          //Navigator.of(context)
                                                            //  .push(
                                                              //    MaterialPageRoute(builder: (context) => EventoClientePage(data: snapshot.data[index])
                                                                //    ));
                                                              

                                                        },
                                                        child: SizedBox(
                                                            width: 200,
                                                            height: 100,
                                                            child: Column(
                                                                children: [
                                                                  Text(snapshot.data[index].nombre),
                                                                  Text(snapshot.data[index].tipo),
                                                                  Text(snapshot.data[index].cantidad.toString()),
                                                                  ElevatedButton(onPressed: 
                                                                      () =>{
                                                                        eliminarMaterial(snapshot.data[index].idMaterial)
                                                                            ,setState(() {})
                                                                      }, child: Text("Eliminar material."))
                                                                ],
                                                            ) 
                                                        ),
                                                    ),
                                                ); 
                                              });
                          }
                          else{
                            return Container(
                                child: Center(
                                    child: Text("Cargando..."),
                                ),
                            );
                          }
                        },
                     
                    )

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


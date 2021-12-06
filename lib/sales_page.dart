import 'package:caracol_frontend/evento_empleado_page.dart';
import 'package:caracol_frontend/models/datos_grafica.dart';
import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class SalesPage extends StatefulWidget {


  @override
  _SalesPageState createState() => _SalesPageState();

}

  class _SalesPageState extends State<SalesPage> {


Future<List<Evento>> getEventos() async {
  var getAllEventosList = await Services.getAllEventsList();
  return getAllEventosList;
}
Future<List<DatosGrafica>> getAllDatosParaGraficaList() async {
  var getAllDatosParaGraficaList = await Services.getAllDatosParaGraficaList();
  return getAllDatosParaGraficaList;
}
Future<List> getAllDatos() async {
  List list = [];
  Future<List<DatosGrafica>> listaDatosGrafica = getAllDatosParaGraficaList();
  Future<List<Evento>> listaEventos = getEventos();
  list.add(await listaEventos);
  list.add(await listaDatosGrafica);
  print(await list);
  return list;
}
List<DatosGrafica> lista = [];

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Museo Caracol'),
      home: Container(
        decoration:  BoxDecoration(
            image:  DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          appBar: AppBar(title: const Text('Museo Caracol'),
            backgroundColor: Colors.transparent,
            elevation: 0,
     ),
            body: SingleChildScrollView(
                child: FutureBuilder(
                        future: getAllDatos(),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          print(snapshot.data);
                          if(snapshot.data != null){
                          lista = snapshot.data[1];
                           List<charts.Series<DatosGrafica, String>> series = [
                            charts.Series(
                              id: "developers",
                              data: lista,
                              domainFn: (DatosGrafica series, _) => series.anios.toString(),
                              measureFn: (DatosGrafica series, _) => series.ventas,
                              colorFn: (DatosGrafica series, _) => series.color
                            )];
                            return Column(
                                children: [
                                  Container(
                                      height: 400,
                                      child: 
                                charts.BarChart(series, animate: true,),
                                  ),
                                ListView.builder( itemCount: snapshot.data[0].length,
                                    shrinkWrap: true,
                                              itemBuilder: (BuildContext context, int index){
                                                return Card(
                                                    child: InkWell(
                                                        splashColor: Colors.blue.withAlpha(30),
                                                        onTap: (){
                                                          print(snapshot.data[0][index].noEvento);
                                                          Navigator.of(context)
                                                              .push(
                                                                  MaterialPageRoute(builder: (context) => EventoEmpleadoPage(data: snapshot.data[index])
                                                                    ));
                                                              

                                                        },
                                                        child: SizedBox(
                                                            width: 200,
                                                            height: 100,
                                                            child: Text(snapshot.data[0][index].nombre),
                                                        ),
                                                    ),
                                                ); 
                                              })

                                ],
                            );
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
          )
        ),
      //const MyStatefulWidget()),
    );
  }
}

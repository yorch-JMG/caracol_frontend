import 'package:caracol_frontend/models/empleado.dart';
import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/models/datos_grafica.dart';

List<Empleado> convertToEmpleados (List<dynamic> responseList){
  List<Empleado> empleados = [];
  List<dynamic> arrayEmpleados = responseList[0];
  print(arrayEmpleados);
  for(int i = 0; i < arrayEmpleados.length; i++){
    empleados.add(Empleado.fromJson(arrayEmpleados[i])); 
  }
  return empleados;
}

List<Evento> convertToEventos (List<dynamic> responseList){
  List<Evento> eventos = [];
  List<dynamic> arrayEventos = responseList[0];
  print(arrayEventos);
  for(int i = 0; i < arrayEventos.length; i++){
    eventos.add(Evento.fromJson(arrayEventos[i])); 
  }
  return eventos;
}

List<DatosGrafica> convertToDataForGraph (List<dynamic> responseList){
  List<DatosGrafica> datos = [];
  List<dynamic> arrayDatos = responseList[0];
  print(arrayDatos);
  for(int i = 0; i < arrayDatos.length; i++){
    datos.add(DatosGrafica.fromJson(arrayDatos[i])); 
  }
  return datos;
}

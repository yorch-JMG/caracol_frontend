import 'package:caracol_frontend/models/empleado.dart';
import 'package:caracol_frontend/models/edadPromedio.dart';
import 'package:caracol_frontend/models/evento.dart';
import 'package:caracol_frontend/models/ingresos.dart';
import 'package:caracol_frontend/models/tipoBoleto.dart';
import 'package:caracol_frontend/models/visitante.dart';
import 'package:caracol_frontend/models/convertDynamicToListType.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Services {
  static var ROOT = 'http://192.168.1.67:3000/';
  static var get_all_users = 'users';
  static var get_user_by_id = 'users/getUserById';
  static var login = 'login';
  static var get_all_events = 'events';
  static var get_ticket_for_visitante = 'sales/getTicketForVisitante';
  static var create_sale = 'sales/createTicket';
  static var get_average_age_for_date = 'sales/getAverageAgeByDate';
  static var get_most_common_ticket_type_for_date = 'sales/getMostCommonTicketTypeByDate';
  static var get_ingresos_totales_for_date = 'sales/getIngresosByDate';
  
  static var get_average_age_for_interval = 'sales/getAverageAgeByInterval';
  static var get_most_common_ticket_type_for_interval = 'sales/getMostCommonTicketTypeByInterval';
  static var get_ingresos_totales_for_interval = 'sales/getIngresosByInterval';

  static Future<List<dynamic>> getAllVisitantesList() async {
    try{
      var uri = ROOT+get_all_users;
      final response = await http.get(Uri.parse(uri)); 
      print(response);
      if(200 == response.statusCode){
        List lista = jsonDecode(response.body);
        return lista;
      }
    }
    catch (e){
      print(e);
      List lista = [];
      return lista;
    }
      List lista = [];
      return lista;
  }

  static Future<EdadPromedio> getAverageAgeByInterval(String beginningDate, String endDate) async {
    try{
      var uri = ROOT+get_average_age_for_date;
      final body = {
        'beginningDate' : beginningDate,
        'endDate' : endDate
      };
      final headers = {
        "accept": "application/json", 
        "content-type": "application/json"
      };
      final encodedBody = jsonEncode(body);
      final response = await http.post(
                                    Uri.parse(uri), 
                                    body : encodedBody,
                                    headers: headers); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        EdadPromedio edadPromedio = EdadPromedio();
        edadPromedio.setEdadPromedio(lista[0][0]["edadPromedio"]);
        return edadPromedio;
      }
    }
    catch (e){
      print(e);
    }
    return EdadPromedio();
  }
  static Future<TipoBoleto> getMostCommonTicketTypeByInterval(  String beginningDate, String endDate) async {
    try{
      var uri = ROOT+get_most_common_ticket_type_for_interval;
      final body = {
        'beginningDate' : beginningDate,
        'endDate' : endDate
      };
      final headers = {
        "accept": "application/json", 
        "content-type": "application/json"
      };
      final encodedBody = jsonEncode(body);
      final response = await http.post(
                                    Uri.parse(uri), 
                                    body : encodedBody,
                                    headers: headers); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        TipoBoleto tipoBoleto = TipoBoleto();
        tipoBoleto.setDatosTipoBoleto(lista[0][0]["tipoBoletoMasComun"], lista[0][0]["numeroDeBoletos"]);
        return tipoBoleto;
      }
    }
    catch (e){
      print(e);
    }
    return TipoBoleto();
  }
  static Future<Ingresos> getIngresosByInterval( String beginningDate, String endDate) async {
    try{
      var uri = ROOT+get_ingresos_totales_for_interval;
      final body = {
        'beginningDate' : beginningDate,
        'endDate' : endDate
      };
      final headers = {
        "accept": "application/json", 
        "content-type": "application/json"
      };
      final encodedBody = jsonEncode(body);
      final response = await http.post(
                                    Uri.parse(uri), 
                                    body : encodedBody,
                                    headers: headers); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        Ingresos ingresos = Ingresos();
        ingresos.setIngresos(lista[0][0]["ingresos"]);
        return ingresos;
      }
    }
    catch (e){
      print(e);
    }
    return Ingresos();
  }


  static Future<EdadPromedio> getAverageAgeByDate( String date) async {
    try{
      var uri = ROOT+get_average_age_for_date;
      final body = {
        "dateForSearch" : date
      };
      final headers = {
        "accept": "application/json", 
        "content-type": "application/json"
      };
      final encodedBody = jsonEncode(body);
      final response = await http.post(
                                    Uri.parse(uri), 
                                    body : encodedBody,
                                    headers: headers ); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        EdadPromedio edadPromedio = EdadPromedio();
        edadPromedio.setEdadPromedio(lista[0][0]["edadPromedio"]);
        print(edadPromedio.edadPromedio);
        return edadPromedio;
      }
    }
    catch (e){
      print(e);
    }
    return EdadPromedio();
  }
  static Future<TipoBoleto> getMostCommonTicketTypeByDate( String date) async {
    try{
      var uri = ROOT+get_most_common_ticket_type_for_date;
      final body = {
        'dateForSearch' : date
      };
      final headers = {
        "accept": "application/json", 
        "content-type": "application/json"
      };
      final encodedBody = jsonEncode(body);
      final response = await http.post(
                                    Uri.parse(uri), 
                                    body : encodedBody,
                                    headers: headers); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        TipoBoleto tipoBoleto = TipoBoleto();
        tipoBoleto.setDatosTipoBoleto(lista[0][0]["tipoBoletoMasComun"], lista[0][0]["numeroDeBoletos"]);
        return tipoBoleto;
      }
    }
    catch (e){
      print(e);
    }
    return TipoBoleto();
  }
  static Future<Ingresos> getIngresosByDate( String date) async {
    try{
      var uri = ROOT+get_ingresos_totales_for_date;
      final body = {
        'dateForSearch' : date
      };
      final headers = {
        "accept": "application/json", 
        "content-type": "application/json"
      };
      final encodedBody = jsonEncode(body);
      final response = await http.post(
                                    Uri.parse(uri), 
                                    body : encodedBody,
                                    headers: headers); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        Ingresos ingresos = Ingresos();
        ingresos.setIngresos(lista[0][0]["ingresos"]);
        return ingresos;
      }
    }
    catch (e){
      print(e);
    }
    return Ingresos();
  }

  static Future<List<Evento>> getAllEventsList() async {
    try{
      var uri = ROOT+get_all_events;
      final response = await http.get(Uri.parse(uri)); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        return convertToEventos(lista);
      }
    }
    catch (e){
      print(e);
    }
    return [];
  }

  static Future<List<Empleado>> getAllEmpleadosList() async {
    try{
      var uri = ROOT+get_all_users;
      final response = await http.get(Uri.parse(uri)); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);

        return convertToEmpleados(lista);
      }
    }
    catch (e){
      print(e);
    }
    return [];
  }
}

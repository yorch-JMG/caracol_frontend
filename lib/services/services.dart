import 'package:caracol_frontend/models/empleado.dart';
import 'package:caracol_frontend/models/visitante.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Services {
  static var ROOT = 'http:192.168.1.70:3000/api/';
  static var get_all_users = 'users';
  static var get_user_by_id = 'users/getUserById';
  static var login = 'login';
  static var get_all_events = 'events';
  static var get_ticket_for_visitante = 'sales/getTicketForVisitante';
  static var create_sale = 'sales/createTicket';

  static List<Empleado> parseResponseEmpleados(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Empleado>(
        (json) => Empleado.fromJson(json)).toList();
  }

  static List<Visitante> parseResponseVisitantes(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Visitante>(
        (json) => Visitante.fromJson(json)).toList();
  }

  static Future<List<Visitante>> getAllVisitantesList() async {
    try{
      var uri = ROOT+get_all_users;
      final response = await http.get(Uri.parse(uri)); 
      print(response);
      if(200 == response.statusCode){
        List<Visitante> lista = parseResponseVisitantes(response.body);
        return lista;
      }
    }
    catch (e){
      print(e);
      List<Visitante> lista = [];
      return lista;
    }
      List<Visitante> lista = [];
      return lista;
  }

  static Future<List<Empleado>> getAllEmpleadosList() async {
    try{
      var uri = ROOT+get_all_users;
      final response = await http.get(Uri.parse(uri)); 
      print(response);
      if(200 == response.statusCode){
        List<Empleado> lista = parseResponseEmpleados(response.body);
        return lista;
      }
    }
    catch (e){
      print(e);
      List<Empleado> lista = [];
      return lista;
    }
      List<Empleado> lista = [];
      return lista;
  }
}

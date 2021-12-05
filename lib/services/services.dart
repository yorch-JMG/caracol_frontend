import 'package:caracol_frontend/models/empleado.dart';
import 'package:caracol_frontend/models/visitante.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Services {
  static var ROOT = 'http://192.168.1.67:3000/api/';
  static var get_all_users = 'users';
  static var get_user_by_id = 'users/getUserById';
  static var login = 'login';
  static var get_all_events = 'events';
  static var get_ticket_for_visitante = 'sales/getTicketForVisitante';
  static var create_sale = 'sales/createTicket';


  static Future<String> getAllVisitantesList() async {
    try{
      var uri = ROOT+get_all_users;
      final response = await http.get(Uri.parse(uri)); 
      print(response);
      if(200 == response.statusCode){
        String lista = jsonDecode(response.body);
        return lista;
      }
    }
    catch (e){
      print(e);
      String lista = '';
      return lista;
    }
      String lista = '';
      return lista;
  }

  static Future<List<dynamic>> getAllEmpleadosList() async {
    try{
      var uri = ROOT+get_all_users;
      final response = await http.get(Uri.parse(uri)); 
      if(200 == response.statusCode){
        List<dynamic> lista = jsonDecode(response.body);
        print(lista);
        return lista;
      }
    }
    catch (e){
      print(e);
    }
    return [];
  }
}

import 'package:caracol_frontend/constants/login_page_consts.dart';
import 'package:caracol_frontend/home_page.dart';
import 'package:caracol_frontend/register_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginPageConsts loginPageProps =  LoginPageConsts();
  final _correoElectronico = TextEditingController();
  final _contrasena = TextEditingController();
  var _mensaje;
  bool _validate_correo = false;
  bool _validate_contra = false;
    
  void signIn() async {
      print(_correoElectronico.text);
      var uri = "http://192.168.68.113:3000/api/login";
      var body = {
        "correoElectronico" : _correoElectronico.text,
        "contrasena": _contrasena.text,
      };
      Map<String, String> requestHeaders = 
        {'Content-type': 'application/json',
        'Accept': 'application/json',};
      http.Response response = await http.post(Uri.parse(uri), body: jsonEncode(body), headers: requestHeaders);

      var dataUser = json.decode(response.body);

      if(dataUser.length == 0){
        setState(() {
          _mensaje = dataUser;
          print(_mensaje);
        });
      }
      else {
        setState(() {
          _mensaje = dataUser[0][0].toString();
          if(_mensaje.contains("incorrecta")){
            print(_mensaje);
          }
          else{
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            print(_mensaje);
          }
          print(_mensaje);

        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 100, 20, 25),
                child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        'Log in', 
                        style: TextStyle(fontSize: loginPageProps.titleFontSize),
                    ),
                    SizedBox(
                        height: loginPageProps.verticalSpacing,
                    ),
                    Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(0),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Card(
                                child: Container(
                                    height: 270,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: 
                                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                      child: Column(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                        controller: _correoElectronico,
                                                        decoration: InputDecoration(
                                                          hintText: loginPageProps.emailHintText,
                                                          errorText: _validate_correo ? "Ingresa un correo electronico valido." : null
                                                        ),
                                                      ),
                                                ),
                                            SizedBox(
                                              height: loginPageProps.centerVerticalSpacing,
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                controller: _contrasena,
                                                decoration: InputDecoration(
                                                  hintText: loginPageProps.passwordHintText,
                                                  errorText: _validate_contra ? "Ingresa tu contrasena." : null
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: loginPageProps.verticalSpacing,
                                            ),
                                          ],
                                      ),
                                ),
                                ),
                        ), 
                    ),
                    Padding(
                        padding: const EdgeInsets.all(25),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              child: Text(loginPageProps.buttonText),
                              onPressed: () {
                                    _correoElectronico.text.isEmpty ? _validate_correo = true : _validate_correo = false;
                                    _contrasena.text.isEmpty ? _validate_contra = true : _validate_contra = false;
                                    if (_validate_correo && _validate_contra){
                                      print('not ready to post');
                                    }
                                    else{
                                      signIn();
                                    }
                              },
                        ),
                      ),
                    ),
                    SizedBox(
                        height: loginPageProps.verticalSpacing,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                                child: Text(loginPageProps.textButtonText),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                                      }
                              ),
                            ),
                                  
                        ), 
                ],
            ),
        ),
    )
  );
}
}

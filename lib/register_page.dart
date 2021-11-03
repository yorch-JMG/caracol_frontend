import 'package:caracol_frontend/constants/register_page_consts.dart';
import 'package:caracol_frontend/home_page.dart';
import 'dart:convert';
import 'dart:async';
import 'package:caracol_frontend/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();

}

  class _RegisterPageState extends State<RegisterPage> {
    final RegisterPageConsts registerPageProps = RegisterPageConsts();
    final _nombre = TextEditingController();
    final _correoElectronico = TextEditingController();
    final _contrasena = TextEditingController();
    final _puesto = TextEditingController();
    final _departamento = TextEditingController();
    final _telefono = TextEditingController();
    var _mensaje;
    bool _validate_nombre = false;
    bool _validate_correo = false;
    bool _validate_contra = false;
    bool _validate_puesto = false;
    bool _validate_departamento = false;
    bool _validate_telefono = false;
    final _formKey = GlobalKey<FormState>();

    void register() async {
      var uri = "http://localhost:3000/api/users/create";
      final res = await http.post(Uri.parse(uri), body: {
        "nombre": _nombre.text,
        "correoElectronico" : _correoElectronico.text,
        "puesto": _puesto.text,
        "departamento": _departamento.text,
        "telefono": _telefono.text
      });

      var dataUser = jsonDecode(res.body);

      if(dataUser.length == 0){
        setState(() {
          _mensaje = "Usuario registrado";
        });
      }
      else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
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
                          'Registrate', 
                          style: TextStyle(fontSize: registerPageProps.titleFontSize),
                      ),
                      SizedBox(
                          height: registerPageProps.verticalSpacing,
                      ),
                      Container(
                          height: 780,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(0),
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Form(
                                key: _formKey,
                                child: Card(
                                  child: Container(
                                      height: 400,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: 
                                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: TextField(
                                                          controller: _nombre,
                                                          decoration: InputDecoration(
                                                            hintText: registerPageProps.nameHintText,
                                                            errorText: _validate_nombre ? "Este campo es obligatorio." : null
                                                          ),
                                                          
                                                        ),
                                                        
                                                  ),
                                              SizedBox(
                                                  height: registerPageProps.verticalSpacing,
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: TextField(
                                                          controller: _correoElectronico,
                                                          decoration: InputDecoration(
                                                            hintText: registerPageProps.emailHintText,
                                                            errorText: _validate_correo  ? "Este campo es obligatorio." : null
                                                          ),
                                                        ),
                                                  ),
                                              SizedBox(
                                                  height: registerPageProps.verticalSpacing,
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: TextField(
                                                          controller: _contrasena,
                                                          decoration: InputDecoration(
                                                            hintText: registerPageProps.passwordHintText,
                                                            errorText: _validate_contra ? "Este campo es obligatorio." : null
                                                            ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: registerPageProps.verticalSpacing,
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: TextField(
                                                          controller: _puesto,
                                                          decoration: InputDecoration(
                                                            hintText: registerPageProps.puestoHintText,
                                                            errorText: _validate_puesto ? "Este campo es obligatorio." : null
                                                            ),
                                                  ),
                                              ),
                                              SizedBox(
                                                  height: registerPageProps.verticalSpacing,
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: TextField(
                                                          controller: _departamento,
                                                          decoration: InputDecoration(
                                                            hintText: registerPageProps.departamentoHintText,
                                                            errorText: _validate_departamento ? "Este campo es obligatorio." : null
                                                            ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: registerPageProps.verticalSpacing,
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: TextField(
                                                          controller: _telefono,
                                                          decoration: InputDecoration(
                                                            hintText: registerPageProps.telefonoHintText,
                                                            errorText: _validate_telefono ? "Este campo es obligatorio." : null
                                                            ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: registerPageProps.verticalSpacing,
                                              ),
                                            ],
                                        ),
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
                                child: Text(registerPageProps.buttonText),
                                onPressed: () {
                                  setState(() {
                                    _nombre.text.isEmpty ? _validate_nombre = true : _validate_nombre = false;
                                    _correoElectronico.text.isEmpty ? _validate_correo = true : _validate_correo = false;
                                    _contrasena.text.isEmpty ? _validate_contra = true : _validate_contra = false;
                                    _puesto.text.isEmpty ? _validate_puesto = true : _validate_puesto = false;
                                    _departamento.text.isEmpty ? _validate_departamento = true : _validate_departamento = false;
                                    _telefono.text.isEmpty ? _validate_telefono = true : _validate_telefono = false;
                                  });
                                  if(_validate_nombre && _validate_correo && _validate_contra && _validate_puesto && _validate_departamento && _validate_telefono){
                                    print("Not ready to post.");
                                  }
                                  else{
                                    register(); 
                                  }
                                },
                          ),
                        ),
                      ),
                      SizedBox(
                          height: registerPageProps.verticalSpacing,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                  child: Text(registerPageProps.textButtonText),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
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

import 'package:caracol_frontend/constants/register_page_consts.dart';
import 'package:caracol_frontend/login_page.dart';
import 'package:caracol_frontend/services/services.dart';
import 'package:caracol_frontend/ticket_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';




class SalePage extends StatefulWidget {

  final int noEvento;
  SalePage({Key? key,
                  required this.noEvento,
  }) : super(key: key);

  @override
  _SalePageState createState() => _SalePageState();

}

  class _SalePageState extends State<SalePage> {
    final RegisterPageConsts registerPageProps = RegisterPageConsts();
    final _nombre = TextEditingController();
    final _correoElectronico = TextEditingController();
    final _edad = TextEditingController();

    var _mensaje;
    bool _validate_nombre = false;
    bool _validate_correo = false;
    bool _validate_edad = false;
    final _formKey = GlobalKey<FormState>();

    void register(String nombre,int edad, String correoElectronico, int noEvento) async {
      String result = await Services.createSale(nombre, edad, correoElectronico, noEvento);
      print(result);
      if(result.contains("generado")){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketPage()));
      } 
      else{
        print("Error al generar ticket.");
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
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight: 70.0,
                                        minHeight: 70.0,
                                    ),
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
                                              Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: TextField(
                                                          keyboardType: TextInputType.number,
                                                          controller: _edad,
                                                          decoration: InputDecoration(
                                                            hintText: "Edad",
                                                            errorText: _validate_edad  ? "Este campo es obligatorio." : null
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
                                    _edad.text.isEmpty ? _validate_edad = true : _validate_edad = false;
                                  });
                                  if(_validate_nombre && _validate_correo && _validate_edad){
                                    print("Not ready to post.");
                                  }
                                  else{
                                    register(_nombre.text, int.parse(_edad.text), _correoElectronico.text, widget.noEvento); 
                                  }
                                },
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

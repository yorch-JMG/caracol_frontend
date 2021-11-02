import 'package:caracol_frontend/constants/register_page_consts.dart';
import 'package:caracol_frontend/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final RegisterPageConsts registerPageProps = RegisterPageConsts();
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
                        style: TextStyle(fontSize: registerPageProps.titleFontSize),
                    ),
                    SizedBox(
                        height: registerPageProps.verticalSpacing,
                    ),
                    Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(0),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
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
                                                        decoration: InputDecoration(
                                                        hintText: registerPageProps.emailHintText,
                                                        ),
                                                      ),
                                                ),
                                            
                                            SizedBox(
                                              height: registerPageProps.verticalSpacing,
                                            ),

                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                decoration: InputDecoration(
                                                hintText: registerPageProps.passwordHintText,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                decoration: InputDecoration(
                                                hintText: registerPageProps.puestoHintText,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                decoration: InputDecoration(
                                                hintText: registerPageProps.departamentoHintText,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                decoration: InputDecoration(
                                                hintText: registerPageProps.telefonoHintText,
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
                    Padding(
                        padding: const EdgeInsets.all(25),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              child: Text(registerPageProps.buttonText),
                            onPressed: () {},
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

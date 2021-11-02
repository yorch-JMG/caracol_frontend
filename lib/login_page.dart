import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double verticalSpacing = 20;
  final double titleFontSize = 32;
  final String emailHintText = "Correo electronico"; 
  final String passwordHintText = "Contrasena"; 
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
                        style: TextStyle(fontSize: titleFontSize),
                    ),
                    SizedBox(
                        height: verticalSpacing,
                    ),
                    Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(0),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Card(
                                child: Container(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: 
                                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                      child: Column(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                        decoration: InputDecoration(
                                                        hintText: emailHintText,
                                                        ),
                                                      ),
                                                ),
                                            
                                            SizedBox(
                                              height: verticalSpacing,
                                            ),

                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                decoration: InputDecoration(
                                                hintText: passwordHintText,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: verticalSpacing,
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
                            child: Text('Sign in'),
                            onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                        height: verticalSpacing,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                                child: Text('Registrate'),
                                onPressed: () {},
                            ),
                                  
                        ) 
                    )
                ],
            ),
        ),
    )
  );
}
}

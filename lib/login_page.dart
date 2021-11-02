import 'package:caracol_frontend/constants/login_page_consts.dart';
import 'package:caracol_frontend/register_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginPageConsts loginPageProps =  LoginPageConsts();
  
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
                                                        hintText: loginPageProps.emailHintText,
                                                        ),
                                                      ),
                                                ),
                                            
                                            SizedBox(
                                              height: loginPageProps.verticalSpacing,
                                            ),

                                            Padding(
                                                padding: const EdgeInsets.all(15),
                                                child: TextField(
                                                decoration: InputDecoration(
                                                hintText: loginPageProps.passwordHintText,
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
                            onPressed: () {},
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
                                },
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

import 'package:caracol_frontend/eventos_page.dart';
import 'package:caracol_frontend/sales_page.dart';
import 'package:caracol_frontend/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

void getData() async {
  var getAllEmpleadosList = await Services.getAllEventsList();
  print(getAllEmpleadosList);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style=
    ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        fixedSize: const Size(140,50),
        primary: Colors.blueAccent,
        shape: RoundedRectangleBorder(
        borderRadius:  BorderRadius.circular(50)
    )
    );
    return MaterialApp(
      title: ('Museo Caracol'),
      home: Container(
        decoration:  BoxDecoration(
            image:  DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: const Text('Museo Caracol'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            ),
          drawer: Drawer(
              child: Container(
                  color: Colors.indigo,
                  child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app,
              color: Colors.white,),
          title: Text('Salir',
              style: TextStyle(
                  color: Colors.white
              ),),
        ),
      ],
    )),
 
              ),             body: Container(
              child:
                Column(
                  
                  children: [
                    Image.asset('images/logo.png', width:300),
                    Padding(
                        padding: const EdgeInsets.all(80),
                        child: Column(
                            children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: 
                      ElevatedButton(
                        style: style,
                        onPressed: (){
                            Navigator.of(context)
                                     .push(
                                        MaterialPageRoute(builder: (context) => EventosClientesPage())
                                      );
                          },
                          child: const Text('Eventos')
                      ),

                              
                            )
                      ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: style,
                            onPressed: (){
                            Navigator.of(context)
                                     .push(
                                        MaterialPageRoute(builder: (context) => SalesPage()
                                      ));
                            },
                              child: const Text('Stats')
                          ),
                        ]
                    )

                            ],
                        ),
                        )
                ],
                ),

                
                
          )
        ),
      ),//const MyStatefulWidget()),
    );
  }
}


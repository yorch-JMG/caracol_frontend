import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
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
            body: Container(
              child:Column(
                children: <Widget>[
                  Image.asset('images/logo.png', width:300),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                            style: style,
                            onPressed: (){},
                            child: const Text('Eventos')
                        ),
                        const SizedBox(height: 200),
                        ElevatedButton(
                          style: style,
                          onPressed: () {},
                          child: const Text('Comprar boletos'),
                        ),
                      ]
                  ),

                ],
              ),
            )
        ),
      ),//const MyStatefulWidget()),
    );
  }
}
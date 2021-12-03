import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style=
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return MaterialApp(
      title: ('Museo Caracol'),
      home: Scaffold(appBar: AppBar(title: const Text('Museo Caracol'),
          backgroundColor: Colors.pink,
     ),
          body:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: style,
                    onPressed: (){},
                    child: const Text('Sexo')
                  ),
                  const SizedBox(height: 200),
                  ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('Sexo 2')
                  )
              ],
              ),
      ),//const MyStatefulWidget()),
    );
  }
}


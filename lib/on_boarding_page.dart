import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:caracol_frontend/home_page.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
      
      child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: "Descubre",
                body: "",
                
            ),
            PageViewModel(
                title: "Explora",
                body: ""
            )
          ],
          done: Text('Saltar'),
          next: Text('Siguiente'),
          onDone: () {
            Navigator.of(context)
                .pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage())
                );
          },
      )
  );
}

import 'package:easyhome/screens/IntroPage/intro_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasyHome());

class EasyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cocogoose',
        accentColor: Color(0xFFE34652),
        textTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.w300),
          title: TextStyle(fontWeight: FontWeight.w300),
          body1:
              TextStyle(fontWeight: FontWeight.w300, color: Color(0xFF707070)),
        ),
      ),
      home: IntroPage(),
    );
  }
}

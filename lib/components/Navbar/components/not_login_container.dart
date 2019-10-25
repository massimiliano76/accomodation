import 'package:easyhome/screens/LoginPage/login_page.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

final textStyle = TextStyle(
  fontSize: SizeConfig.horizontal * 5,
);

class NotLoginContainer extends StatelessWidget {
  NotLoginContainer({this.animationValue});

  final double animationValue;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: LoginPage(),
              ),
            );
          },),
        ),
      ],
    );
  }
}

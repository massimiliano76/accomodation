import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

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
      children: <Widget>[

      ],
    );
  }
}

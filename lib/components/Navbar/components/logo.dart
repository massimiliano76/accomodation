import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RichText(
      text: TextSpan(
        text: 'easy',
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.horizontal * 6,
        ),
        children: [
          TextSpan(
            text: 'home',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w300,
              fontSize: SizeConfig.horizontal * 6,
            ),
          )
        ],
      ),
    );
  }
}

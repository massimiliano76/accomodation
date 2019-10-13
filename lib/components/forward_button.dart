import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  ForwardButton({this.label, this.onTap});

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {

    Color setColor() {
      if(onTap == null) {
        return Color(0xFFD6D6D6);
      } else {
        return Theme.of(context).accentColor;
      }
    }

    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.horizontal * 19, right: SizeConfig.horizontal * 4),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  color: setColor(),
                  fontSize: SizeConfig.horizontal * 4.5,
                ),
              ),
            ),
            Transform.rotate(
              angle: 3.2,
              child: Icon(
                Icons.arrow_back_ios,
                color: setColor(),
                size: SizeConfig.horizontal * 7,
              ),
            )
          ],
        ),
      ),
    );
  }
}

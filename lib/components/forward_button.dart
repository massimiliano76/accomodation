import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  ForwardButton({this.label, this.onTap, this.reverse});

  final String label;
  final Function onTap;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    Color setColor() {
      if (onTap == null) {
        return Color(0xFFD6D6D6);
      } else {
        return Theme.of(context).accentColor;
      }
    }

    SizeConfig().init(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          !reverse
              ? Icon(
                  Icons.arrow_back_ios,
                  color: setColor(),
                  size: SizeConfig.horizontal * 7,
                )
              : SizedBox.shrink(),
          Padding(
            padding: reverse
                ? EdgeInsets.only(right: 8.0)
                : EdgeInsets.only(left: 8.0),
            child: Text(
              label,
              style: TextStyle(
                color: setColor(),
                fontSize: SizeConfig.horizontal * 4.5,
              ),
            ),
          ),
          reverse
              ? Transform.rotate(
                  angle: 3.2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: setColor(),
                    size: SizeConfig.horizontal * 7,
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

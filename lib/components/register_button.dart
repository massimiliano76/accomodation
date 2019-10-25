import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key key,
    this.onTap,
    this.label
  }) : super(key: key);

  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Theme.of(context).accentColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: SizeConfig.horizontal * 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.horizontal * 4,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: SizeConfig.horizontal * 5.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
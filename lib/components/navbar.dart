import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: 'easy',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.horizontal * 6,
              ),
              children: [
                TextSpan(
                  text: 'home',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w300,
                    fontSize: SizeConfig.horizontal * 6,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu),
            iconSize: SizeConfig.horizontal * 6,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

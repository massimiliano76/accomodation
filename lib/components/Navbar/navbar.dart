import 'package:easyhome/components/Navbar/components/logo.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  Navbar({this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(SizeConfig.horizontal * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Logo(
            color: color,
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

import 'package:easyhome/components/Navbar/components/logo.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        margin: EdgeInsets.only(
          top: SizeConfig.horizontal * 13,
          bottom: SizeConfig.horizontal * 10,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Logo(
                    color: Color(0xFF707070),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.facebook,
                        size: SizeConfig.horizontal * 6,
                      ),
                      Icon(
                        FontAwesomeIcons.instagram,
                        size: SizeConfig.horizontal * 6,
                      ),
                      Icon(
                        Icons.email,
                        size: SizeConfig.horizontal * 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.horizontal * 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Copyright 2018',
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: SizeConfig.horizontal * 3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Via Lorem Ipsum,\nPalermo, PA 90136',
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: SizeConfig.horizontal * 3,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.horizontal * 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Private Policy',
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: SizeConfig.horizontal * 3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'easyhome@client.com',
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: SizeConfig.horizontal * 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

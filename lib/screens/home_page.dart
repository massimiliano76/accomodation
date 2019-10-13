import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/navbar.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'domanda.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ForwardButton(
          label: 'Andiamo',
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Domanda(),
              ),
            );
          },
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.vertical * 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Navbar(),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.horizontal * 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Trova\nl’appartamento\nperfetto',
                      style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: SizeConfig.horizontal * 7.5,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.5,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet,\nconsetetur sadipscing elitr, sed diam\nnonumy eirmod tempor invidunt ut\nlabore et dolore magna aliquyam\nerat.',
                      style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: SizeConfig.horizontal * 3.5,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

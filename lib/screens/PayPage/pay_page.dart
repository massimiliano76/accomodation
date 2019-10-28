import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/screens/RoomPage/room_page.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: SizeConfig.horizontal * 22,
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.horizontal * 2),
                child: ForwardButton(
                  label: 'Torna alla home',
                  reverse: false,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: RoomPage(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.horizontal * 2.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Grazie per aver scelto noi',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: SizeConfig.horizontal * 5,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.horizontal * 2,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Navbar(
              context: context,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}

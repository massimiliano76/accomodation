import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/screens/CityQuestion/city_question.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class IntroSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.horizontal * 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.horizontal * 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Raccontaci di te!',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: SizeConfig.horizontal * 7.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: SizeConfig.horizontal * 3.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: SizeConfig.horizontal * 23,
                  right: SizeConfig.horizontal * 9),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ForwardButton(
                  label: 'Avanti',
                  reverse: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: CityQuestion(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Navbar(
              color: Theme.of(context).accentColor,
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}

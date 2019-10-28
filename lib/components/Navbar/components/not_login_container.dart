import 'package:easyhome/screens/HowWorks/how_works.dart';
import 'package:easyhome/screens/LoginPage/login_page.dart';
import 'package:easyhome/screens/RegisterPage/register_page.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NotLoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: SizeConfig.horizontal * 4.7,
    );
    SizeConfig().init(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.horizontal * 6),
      children: <Widget>[
        SizedBox(
          height: SizeConfig.horizontal * 17,
        ),
        GestureDetector(
          child: Text(
            'Come Funziona',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: HowWorks(),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.horizontal * 30,
        ),
        GestureDetector(
          child: Text(
            'Registrati',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
          onTap: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: RegisterPage(),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.horizontal * 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.supervised_user_circle,
              size: SizeConfig.horizontal * 6,
              color: Color(0xFF777777),
            ),
            GestureDetector(
              child: Text(
                'Accedi',
                style: textStyle,
              ),
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: LoginPage(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

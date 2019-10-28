import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/ProfilePage/profile_page.dart';
import 'package:easyhome/screens/RoomPage/room_page.dart';
import 'package:easyhome/services/data.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

class LoginContainer extends StatelessWidget {
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
            'Appartamenti',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(child: RoomPage(), type: PageTransitionType.fade),
            );
          },
        ),
        SizedBox(
          height: SizeConfig.horizontal * 3,
        ),
        GestureDetector(
          child: Text(
            'Preferiti',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: SizeConfig.horizontal * 3,
        ),
        GestureDetector(
          child: Text(
            'Filtri di ricerca',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: SizeConfig.horizontal * 30,
        ),
        GestureDetector(
          child: Text(
            'Il mio profilo',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  child: ProfilePage(), type: PageTransitionType.fade),
            );
          },
        ),
        SizedBox(
          height: SizeConfig.horizontal * 3,
        ),
        GestureDetector(
          child: Text(
            'Opzioni',
            textAlign: TextAlign.end,
            style: textStyle,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: SizeConfig.horizontal * 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.exit_to_app,
              size: SizeConfig.horizontal * 6,
              color: Color(0xFF777777),
            ),
            StoreConnector<AppState, VoidCallback>(
              converter: (store) => () {
                store.dispatch(LogoutAction());
                store.state.hasFinished
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            child: RoomPage(), type: PageTransitionType.fade),
                        (Route<dynamic> route) => false)
                    : Navigator.of(context).pushReplacement(
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Data.pages[store.state.pagePosition],
                        ),
                      );
              },
              builder: (context, logout) => GestureDetector(
                child: Text(
                  'Esci',
                  style: textStyle,
                ),
                onTap: logout,
              ),
            ),
          ],
        )
      ],
    );
  }
}

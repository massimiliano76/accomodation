import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/input_form.dart';
import 'package:easyhome/components/register_button.dart';
import 'package:easyhome/components/register_card.dart';
import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/RegisterPage/register_page.dart';
import 'package:easyhome/screens/RoomPage/room_page.dart';
import 'package:easyhome/services/animations.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easyhome/services/data.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomCenter,
                child: FadeInWithScale(
                  delay: 550,
                  child: RegisterCard(
                    title: 'Nuovo su easyhome?',
                    buttonLabel: "Registrati",
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: RegisterPage(),
                      ),
                    ),
                  ),
                )),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.horizontal * 10),
              margin: EdgeInsets.only(top: SizeConfig.vertical * 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeIn(
                    child: Text(
                      'Accedi',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: SizeConfig.horizontal * 4.5),
                    ),
                  ),
                  SizedBox(height: 10),
                  FadeInWithTranslate(
                    delay: 100,
                    isX: true,
                    translateXStart: 150.0,
                    translateXEnd: 0.0,
                    child: InputForm(
                      placeholder: 'Email',
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  FadeInWithTranslate(
                    delay: 250,
                    isX: true,
                    translateXStart: -150.0,
                    translateXEnd: 0.0,
                    child: InputForm(
                      placeholder: 'Password',
                      textInputType: TextInputType.text,
                      isObscured: true,
                    ),
                  ),
                  SizedBox(height: 15),
                  FadeInWithTranslate(
                    delay: 400,
                    isX: false,
                    translateYStart: 80,
                    translateYEnd: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        StoreConnector<AppState, VoidCallback>(
                          converter: (store) => () {
                            store.dispatch(LoginAction());
                            Navigator.of(context).pushReplacement(
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: store.state.hasFinished
                                    ? RoomPage()
                                    : Data.pages[store.state.pagePosition],
                              ),
                            );
                          },
                          builder: (context, login) => RegisterButton(
                            onTap: login,
                            label: "Login",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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

import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/input_form.dart';
import 'package:easyhome/components/register_button.dart';
import 'package:easyhome/components/register_card.dart';
import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/LoginPage/login_page.dart';
import 'package:easyhome/screens/RoomPage/room_page.dart';
import 'package:easyhome/services/animations.dart';
import 'package:easyhome/services/data.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

class RegisterPage extends StatelessWidget {
  List<String> label = [
    "Nome",
    "Cognome",
    "Email",
    "Nome Utente",
    "Password",
    "Ripeti Password",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: SizeConfig.horizontal * 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        FadeInWithScale(
                          child: RegisterCard(
                            title: 'Hai già un account?',
                            buttonLabel: "Accedi",
                            onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: LoginPage(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.horizontal * 6,
                            vertical: SizeConfig.horizontal * 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeIn(
                                delay: 500,
                                duration: 300,
                                child: Text(
                                  'Registrati',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: SizeConfig.horizontal * 4.5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.horizontal * 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: label
                                    .asMap()
                                    .map(
                                      (index, element) {
                                        bool obscure = false;
                                        if (label[index].contains("Password")) {
                                          obscure = true;
                                        }
                                        return MapEntry(
                                          index,
                                          FadeInWithTranslate(
                                            isX: true,
                                            translateXStart: 140.0,
                                            translateXEnd: 0.0,
                                            delay: 700 - index * 70,
                                            child: InputForm(
                                              textInputType: TextInputType.text,
                                              label: label[index],
                                              isObscured: obscure,
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                    .values
                                    .toList(),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  StoreConnector<AppState, VoidCallback>(
                                    converter: (store) => () {
                                      store.dispatch(LoginAction());
                                      Navigator.of(context).pushAndRemoveUntil(
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: store.state.hasFinished
                                                  ? RoomPage()
                                                  : Data.pages[store
                                                      .state.pagePosition]),
                                          (Route<dynamic> route) => false);
                                    },
                                    builder: (context, login) => RegisterButton(
                                      label: "Registrati",
                                      onTap: login,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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

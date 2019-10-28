import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/input_form.dart';
import 'package:easyhome/components/register_button.dart';
import 'package:easyhome/components/register_card.dart';
import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/CityQuestion/city_question.dart';
import 'package:easyhome/screens/LoginPage/login_page.dart';
import 'package:easyhome/screens/RoomPage/room_page.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

class RegisterPage extends StatelessWidget {
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
                        Container(
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
                          padding: EdgeInsets.only(
                            left: SizeConfig.horizontal * 6,
                            right: SizeConfig.horizontal * 6,
                            bottom: SizeConfig.horizontal * 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.horizontal * 6),
                                child: Text(
                                  'Registrati',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: SizeConfig.horizontal * 4.5,
                                  ),
                                ),
                              ),
                              InputForm(
                                textInputType: TextInputType.text,
                                label: 'Nome',
                              ),
                              InputForm(
                                textInputType: TextInputType.text,
                                label: 'Cognome',
                              ),
                              InputForm(
                                textInputType: TextInputType.emailAddress,
                                label: 'Email',
                              ),
                              InputForm(
                                textInputType: TextInputType.text,
                                label: 'Nome Utente',
                              ),
                              InputForm(
                                textInputType: TextInputType.text,
                                isObscured: true,
                                label: 'Password',
                              ),
                              InputForm(
                                textInputType: TextInputType.text,
                                isObscured: true,
                                label: 'Ripeti Password',
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
                                      store.state.hasFinished
                                          ? Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child: RoomPage()),
                                                  (Route<dynamic> route) =>
                                                      false)
                                          : Navigator.of(context)
                                              .pushReplacement(
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child: CityQuestion(),
                                              ),
                                            );
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

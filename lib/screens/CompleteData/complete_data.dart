import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/input_form.dart';
import 'package:easyhome/components/payments_card.dart';
import 'package:easyhome/screens/LastLook/last_look.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CompleteData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Positioned(
            top: SizeConfig.horizontal * 22,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.horizontal * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ForwardButton(
                    label: 'Indietro',
                    reverse: false,
                    onTap: () => Navigator.pop(context),
                  ),
                  ForwardButton(
                    label: 'Avanti',
                    reverse: true,
                    onTap: () {
                      Navigator.push(context, PageTransition(child: LastLook(), type: PageTransitionType.fade));
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.horizontal * 32),
            child: ListView(
              children: <Widget>[
                PaymentsCard(
                  title: "Completa i tuoi dati",
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.horizontal * 5),
                  child: Column(
                    children: <Widget>[
                      InputForm(
                        label: "N. Carta di Identità",
                      ),
                      InputForm(
                        label: "Codice Fiscale",
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: InputForm(label: "Foto carta d'Identità"),
                          ),
                          SizedBox(
                            width: SizeConfig.horizontal * 4,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                height: SizeConfig.horizontal * 15,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Icon(
                                  Icons.file_upload,
                                  color: Colors.white,
                                  size: SizeConfig.horizontal * 6.5,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: LinearGradient(
                                    // Where the linear gradient begins and ends
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    // Add one stop for each color. Stops should increase from 0 to 1
                                    stops: [0.3, 1],
                                    colors: [Color(0xFFFA7A84), Color(0xFFE34652)],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context, PageTransition(child: LastLook(), type: PageTransitionType.fade));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.horizontal * 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.horizontal * 5),
                  child: Footer(),
                ),
              ],
            ),
          ),
          Navbar(
            context: context,
            color: Theme.of(context).accentColor,
          ),
        ],
      )),
    );
  }
}

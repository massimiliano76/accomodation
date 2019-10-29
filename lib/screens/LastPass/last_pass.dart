import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/payments_card.dart';
import 'package:easyhome/screens/ThanksPage/thanks_page.dart';
import 'package:easyhome/services/animations.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'components/pdf_button.dart';

class LastPass extends StatelessWidget {
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
                      label: 'Paga',
                      reverse: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: ThanksPage(),
                            type: PageTransitionType.fade,
                          ),
                        );
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
                  FadeInWithScale(
                    delay: 100,
                    child: PaymentsCard(
                      title: "Ultimo passo",
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.horizontal * 10,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.horizontal * 13),
                        child: Column(
                          children: <Widget>[
                            FadeInWithTranslate(
                              isX: true,
                              delay: 500,
                              translateXStart: 140,
                              translateXEnd: 0,
                              child: Text(
                                'Firma il contratto',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: SizeConfig.horizontal * 4,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.horizontal * 3,
                            ),
                            FadeInWithTranslate(
                              isX: true,
                              delay: 700,
                              translateXStart: -140,
                              translateXEnd: 0,
                              child: Text(
                                'Scarica e leggi il contratto in PDF che abbiamo creato per te.\nSuccessivamente firmalo nei campi designati e ricaricalo qui cliccando sul tasto qua sotto.\nLa tua pratica verrà processata dai nostri operatori e riceverai una email di conferma entro 24h.',
                                style: TextStyle(
                                  color: Color(0xFFAAAAAA),
                                  fontSize: SizeConfig.horizontal * 2.7,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.horizontal * 10,
                      ),
                      //TODO: make this image with a transparent image
                      FadeIn(
                        delay: 900,
                        child: CachedNetworkImage(
                          height: SizeConfig.horizontal * 27,
                          imageUrl: 'https://i.ibb.co/Z1hhW5W/1desc2.png',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.horizontal * 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: FadeIn(
                      delay: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          PDFButton(
                            title: 'Scarica PDF',
                            icon: Icons.file_download,
                          ),
                          SizedBox(width: SizeConfig.horizontal * 8),
                          PDFButton(
                            title: 'Carica PDF',
                            icon: Icons.file_upload,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.horizontal * 10),
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
        ),
      ),
    );
  }
}

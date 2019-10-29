import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/payments_card.dart';
import 'package:easyhome/screens/DetailRoom/detail_room.dart';
import 'package:easyhome/screens/PaymentPage/payment_page.dart';
import 'package:easyhome/services/animations.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easyhome/services/data.dart';

class LastLook extends StatelessWidget {
  int minusNumber = 0;

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
                        Navigator.push(
                            context,
                            PageTransition(
                                child: PaymentPage(),
                                type: PageTransitionType.fade));
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
                    child: PaymentsCard(
                      title: "Un'ultima occhiata",
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.horizontal * 7,
                  ),
                  Column(
                    children: Data.expandableLabel
                        .asMap()
                        .map((index, element) {
                          minusNumber += 60;
                          return MapEntry(
                            index,
                            FadeInWithTranslate(
                              delay: 450 - index * 70,
                              isX: true,
                              translateXStart: 400.0 - minusNumber,
                              translateXEnd: 0.0,
                              child: ExpandableItem(
                                title: Data.expandableLabel[index],
                                body:
                                    "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil.",
                              ),
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.horizontal * 10),
                    child: Footer(),
                  )
                ],
              ),
            ),
            Navbar(
              context: context,
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}

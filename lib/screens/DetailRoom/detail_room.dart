import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/CompleteData/complete_data.dart';
import 'package:easyhome/screens/RoomPage/components/single_room.dart';
import 'package:easyhome/services/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

import '../../components/forward_button.dart';
import '../../services/size_config.dart';
import 'package:expandable/expandable.dart';

class DetailRoom extends StatelessWidget {
  DetailRoom({
    this.heroTag,
  });

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.horizontal * 22),
              child: ListView(
                children: <Widget>[
                  Padding(
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
                        StoreConnector<AppState, bool>(
                          converter: (store) => store.state.isLogIn,
                          builder: (context, islogIn) => ForwardButton(
                            label: 'Prenota ora',
                            reverse: true,
                            onTap: () {
                              islogIn
                                  ? Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: CompleteData(),
                                      ),
                                    )
                                  : loginDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.horizontal * 6,
                      bottom: SizeConfig.horizontal * 8,
                    ),
                    child: SingleRoom(
                      heroTag: heroTag,
                      isBuying: true,
                    ),
                  ),
                  ExpandableItem(
                    title: 'Descrizione dell’appartamento',
                    body:
                        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil.',
                  ),
                  ExpandableItem(
                    title: 'Descrizione della zona',
                    body:
                        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil.',
                  ),
                  ExpandableItem(
                    title: 'Regole dell\'appartamento',
                    body:
                        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil.',
                  ),
                  ExpandableItem(
                    title: 'Mezzi di traporto',
                    body:
                        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil.',
                  ),
                  ExpandableItem(
                    title: 'Prezzo e disponibilità',
                    body:
                        'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil.',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.horizontal * 10,
                    ),
                    child: Footer(),
                  ),
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

class ExpandableItem extends StatelessWidget {
  const ExpandableItem({Key key, this.title, this.body}) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      tapBodyToCollapse: true,
      iconPlacement: ExpandablePanelIconPlacement.left,
      headerAlignment: ExpandablePanelHeaderAlignment.center,
      header: Text(
        title,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      expanded: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.horizontal * 6),
        child: Text(
          body,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFFAAAAAA),
            fontSize: SizeConfig.horizontal * 3.5,
          ),
        ),
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  }
}

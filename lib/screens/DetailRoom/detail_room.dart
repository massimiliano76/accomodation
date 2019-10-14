import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/screens/RoomPage/components/single_room.dart';
import 'package:flutter/material.dart';

import '../../components/forward_button.dart';
import '../../services/size_config.dart';
import 'package:expandable/expandable.dart';

class DetailRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Navbar(
              color: Theme.of(context).accentColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.horizontal * 2,
                    ),
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
                          ),
                          ForwardButton(
                            label: 'Prenota ora',
                            reverse: true,
                            onTap: () {},
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
            )
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
          ),
        ),
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    );
  }
}

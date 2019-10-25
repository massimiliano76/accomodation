import 'package:easyhome/screens/DetailRoom/detail_room.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../services/size_config.dart';

class SingleRoom extends StatelessWidget {
  SingleRoom({this.heroTag, this.isBuying});

  final String heroTag;
  final bool isBuying;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: DetailRoom(heroTag: heroTag,),
            ),
          );
        },
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Hero(
              tag: heroTag,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, SizeConfig.horizontal * 5),
                height: !isBuying
                    ? SizeConfig.horizontal * 93
                    : SizeConfig.horizontal * 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x88888888),
                      offset: Offset(6.0, 6.0),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11.0),
                              child: Image.network(
                                'http://d2e5ushqwiltxm.cloudfront.net/wp-content/uploads/sites/12/2016/02/09120423/Pullman-Executive-Room-King-Bed-1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.vertical * 2,
                              horizontal: SizeConfig.horizontal * 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Row(
                                    mainAxisAlignment: isBuying
                                        ? MainAxisAlignment.spaceBetween
                                        : MainAxisAlignment.start,
                                    children: <Widget>[
                                      Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          'Calle Perdomo 20',
                                          style: TextStyle(
                                            fontSize: SizeConfig.horizontal * 5,
                                          ),
                                        ),
                                      ),
                                      isBuying
                                          ? Material(
                                            color: Colors.transparent,
                                            child: Text(
                                                '450€',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: SizeConfig.horizontal * 5,
                                                ),
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.',
                                    style: TextStyle(
                                        fontSize: SizeConfig.horizontal * 3.1,
                                        color: Color(0xFFAAAAAA)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: SizeConfig.vertical * 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      isBuying
                                          ? SizedBox.shrink()
                                          : Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          '450€',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: SizeConfig.horizontal * 5,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 15,
              top: isBuying
                  ? SizeConfig.horizontal * 73.5
                  : SizeConfig.horizontal * 40,
              child: GestureDetector(
                onTap: () {
                  setState(() => isSelected = !isSelected);
                  if (isSelected) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        content: Container(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(Icons.close),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.horizontal * 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.favorite,
                                      size: SizeConfig.horizontal * 20,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: SizeConfig.horizontal * 5),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            'Aggiunto ai preferiti!',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFF707070),
                                              fontSize:
                                              SizeConfig.horizontal *
                                                  4.5,
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            'Potrai ritrovare tutti i tuoi appartamenti preferiti nella dashboard in alto a destra.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFAAAAAA),
                                              fontWeight: FontWeight.w300,
                                              fontSize:
                                              SizeConfig.horizontal * 3,
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Hero(
                  tag: "$heroTag avatar",
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(2, 5),
                          )
                        ]
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        isSelected ? Icons.favorite : Icons.favorite_border,
                        color: Theme.of(context).accentColor,
                        size: SizeConfig.horizontal * 7,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

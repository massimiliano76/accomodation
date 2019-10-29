import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/DetailRoom/detail_room.dart';
import 'package:easyhome/services/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easyhome/main.dart';
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
          if (!isBuying) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: DetailRoom(
                  heroTag: heroTag,
                ),
              ),
            );
          }
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
                          child: CachedNetworkImage(
                            imageUrl:
                                'http://d2e5ushqwiltxm.cloudfront.net/wp-content/uploads/sites/12/2016/02/09120423/Pullman-Executive-Room-King-Bed-1.jpg',
                            imageBuilder: (context, imageProvider) => Container(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11.0),
                                child: Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.vertical * 2,
                              horizontal: SizeConfig.horizontal * 2,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
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
                                              fontSize:
                                                  SizeConfig.horizontal * 5,
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
                                                    fontSize:
                                                        SizeConfig.horizontal *
                                                            5,
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
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.vertical * 2),
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
                                                    fontSize:
                                                        SizeConfig.horizontal *
                                                            5,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
              child: StoreConnector<AppState, VoidCallback>(
                converter: (store) => () {
                  if (store.state.isLogIn) {
                    // ignore: unnecessary_statements
                    if (isSelected) {
                      loginDialog(context, "favorite");
                      store
                          .dispatch(AddToFavorite(payload: int.parse(heroTag)));
                    } else {
                      store.dispatch(
                          RemoveToFavorite(payload: int.parse(heroTag)));
                    }
                    setState(() => isSelected = !isSelected);
                  } else {
                    loginDialog(context, "favorite");
                  }
                },
                builder: (context, favorite) => GestureDetector(
                  onTap: favorite,
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
                        ],
                      ),
                      child: CircleAvatar(
                        radius: SizeConfig.horizontal * 7,
                        backgroundColor: Colors.white,
                        child: Icon(
                          store.state.favorite[int.parse(heroTag)]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).accentColor,
                          size: SizeConfig.horizontal * 7,
                        ),
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

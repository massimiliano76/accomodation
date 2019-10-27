import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/RoomPage/room_page.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

loginDialog(BuildContext context) {
  SizeConfig().init(context);
  return showDialog(
    context: context,
    builder: (context) => StoreConnector<AppState, bool>(
      converter: (store) => store.state.isLogIn,
      builder: (context, isLogIn) => AlertDialog(
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
                padding: EdgeInsets.only(top: SizeConfig.horizontal * 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      isLogIn ? Icons.favorite : Icons.favorite_border,
                      size: SizeConfig.horizontal * 20,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.horizontal * 5),
                      child: Column(
                        children: <Widget>[
                          Text(
                            isLogIn
                                ? 'Aggiunto ai preferiti!'
                                : 'Accedi per salvare i tuoi appartamenti preferiti!',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF707070),
                              fontSize: SizeConfig.horizontal * 4.5,
                            ),
                          ),
                          isLogIn
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: 15),
                                    Text(
                                      'Potrai ritrovare tutti i tuoi appartamenti preferiti nella dashboard in alto a destra.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFAAAAAA),
                                        fontWeight: FontWeight.w300,
                                        fontSize: SizeConfig.horizontal * 3,
                                      ),
                                    )
                                  ],
                                )
                              : SizedBox.shrink(),
                          SizedBox(height: 30),
                          !isLogIn
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    ForwardButton(
                                      label: "Accedi",
                                      reverse: true,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: RoomPage(),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                )
                              : SizedBox.shrink()
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
    ),
  );
}

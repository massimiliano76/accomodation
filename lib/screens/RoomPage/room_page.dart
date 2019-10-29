import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/screens/RoomPage/components/single_room.dart';
import 'package:easyhome/services/animations.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.horizontal * 15),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      FadeInWithScale(
                        child: SingleRoom(
                          heroTag: '1',
                          isBuying: false,
                        ),
                      ),
                      FadeInWithScale(
                        delay: 200,
                        child: SingleRoom(
                          heroTag: '2',
                          isBuying: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.horizontal * 10,
                          right: SizeConfig.horizontal * 10,
                        ),
                        child: Footer(),
                      ),
                    ],
                  ),
                ),
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

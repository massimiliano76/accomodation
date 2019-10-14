import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/components/footer.dart';
import 'package:easyhome/screens/RoomPage/components/single_room.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SingleRoom(
                        heroTag: '1',
                        isBuying: false,
                      ),
                      SingleRoom(
                        heroTag: '2',
                        isBuying: false,
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
          ],
        ),
      ),
    );
  }
}

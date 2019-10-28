import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/screens/ProfilePage/components/apartment_card.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: SizeConfig.horizontal * 27),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.horizontal * 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Il mio profilo',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: SizeConfig.horizontal * 4.5,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.horizontal * 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl:
                                  "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png",
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundImage: imageProvider,
                                radius: SizeConfig.horizontal * 12,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mario Rossi',
                                  style: TextStyle(
                                    fontSize: SizeConfig.horizontal * 4,
                                  ),
                                ),
                                Text(
                                  '26 Dicembre 1998',
                                  style: TextStyle(
                                    fontSize: SizeConfig.horizontal * 3.5,
                                    color: Color(0xFFAAAAAA),
                                  ),
                                ),
                                Text(
                                  'Italia, Palermo, PA',
                                  style: TextStyle(
                                    fontSize: SizeConfig.horizontal * 3.5,
                                    color: Color(0xFFAAAAAA),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: SizeConfig.horizontal * 3,
                            ),
                            Icon(
                              Icons.edit,
                              color: Color(0xFF707070),
                              size: SizeConfig.horizontal * 6,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.horizontal * 15,
                        ),
                        Text(
                          'Il mio appartamento',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: SizeConfig.horizontal * 4.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.horizontal * 4,
                    ),
                    child: ApartmentCard(),
                  ),
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

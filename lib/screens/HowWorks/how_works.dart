import 'package:easyhome/components/footer.dart';
import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/services/animations.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';

class HowWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double minusNumber = 0.0;

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
                    ),
                    ForwardButton(
                      label: 'Andiamo',
                      reverse: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.horizontal * 42),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.horizontal * 10),
                child: ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeInWithTranslate(
                          delay: 250,
                          duration: 400,
                          isX: true,
                          translateXStart: 90,
                          translateXEnd: 0,
                          child: Text(
                            'COME FUNZIONA',
                            style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: SizeConfig.horizontal * 3.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.horizontal * 5,
                        ),
                        FadeInWithTranslate(
                          delay: 550,
                          isX: true,
                          translateXStart: 90,
                          translateXEnd: 0,
                          child: Text(
                            'È semplice\ncome contare!',
                            style: TextStyle(
                              fontSize: SizeConfig.horizontal * 7,
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.horizontal * 7),
                        Column(
                          children: Data.featureItemLabel
                              .asMap()
                              .map(
                                (index, element) {
                                  minusNumber += 20;
                                  return MapEntry(
                                    index,
                                    FadeInWithTranslate(
                                      isX: true,
                                      delay: 750 + index * 150,
                                      duration: 650,
                                      translateXStart: 140 - minusNumber,
                                      translateXEnd: 0.0,
                                      child: FeatureItem(
                                        title: Data.featureItemLabel[index],
                                        body:
                                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                                      ),
                                    ),
                                  );
                                },
                              )
                              .values
                              .toList(),
                        )
                      ],
                    ),
                    Footer(),
                  ],
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

class FeatureItem extends StatelessWidget {
  const FeatureItem({Key key, this.title, this.body}) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.horizontal * 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: SizeConfig.horizontal * 4,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            body,
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: SizeConfig.horizontal * 3,
            ),
          )
        ],
      ),
    );
  }
}

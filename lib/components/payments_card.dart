import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class PaymentsCard extends StatelessWidget {
  PaymentsCard({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        height: SizeConfig.horizontal * 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: SizedBox.expand(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: SizeConfig.horizontal * 5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.',
                        style: TextStyle(
                          fontSize: SizeConfig.horizontal * 3,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.horizontal * 20,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xAA999999),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'Calle Perdomo 20',
                                style: TextStyle(
                                    fontSize: SizeConfig.horizontal * 5),
                              ),
                            ),
                            Material(
                                color: Colors.transparent,
                                child: Text(
                                  '450€',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.horizontal * 5,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.',
                          style: TextStyle(
                              fontSize: SizeConfig.horizontal * 3,
                              color: Color(0xFFAAAAAA)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

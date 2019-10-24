import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

final textStyle = TextStyle(
  fontSize: SizeConfig.horizontal * 5,
);

class NotLoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.horizontal * 13,
              right: SizeConfig.horizontal * 5,
              left: SizeConfig.horizontal * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Come Funziona', style: textStyle),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Registrati', style: textStyle),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.people),
                              Text('Accedi', style: textStyle),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

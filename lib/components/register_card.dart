import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class RegisterCard extends StatelessWidget {

  RegisterCard({this.title, this.subtitle, this.onTap, this.buttonLabel,});

  final String title;
  final String subtitle;
  final String buttonLabel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        height: SizeConfig.horizontal * 47,
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
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: SizeConfig.horizontal * 5.5,
                        color: Color(0xFF707070)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
                    style: TextStyle(
                      fontSize: SizeConfig.horizontal * 3,
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.horizontal * 3.5,
                      right: SizeConfig.horizontal * 3.5,
                    ),
                    child: ForwardButton(
                      label: buttonLabel,
                      reverse: true,
                      onTap: onTap,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

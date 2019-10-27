import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class PDFButton extends StatelessWidget {
  const PDFButton({
    Key key,
    this.title,
    this.icon,
    this.onTap
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFFF4F4F4),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap ?? () {},
          child: Container(
            height: SizeConfig.horizontal * 25,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(icon, size: SizeConfig.horizontal * 6,),
                Text(title, style: TextStyle(fontSize: SizeConfig.horizontal * 3.5),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
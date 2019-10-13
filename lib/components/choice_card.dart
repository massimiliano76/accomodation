import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  ChoiceCard({this.label, this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).accentColor : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x11444444),
              offset: Offset(6.0, 6.0),
              blurRadius: 10,
            )
          ]),
      child: Center(
        child: Text(
          label == null ? 'Palermo' : label,
          style: TextStyle(fontSize: SizeConfig.horizontal * 4, color: isSelected ? Colors.white : Color(0xFF707070)),
        ),
      ),
    );
  }
}

import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class ApartmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.horizontal * 5,
      ),
      padding: EdgeInsets.all(10.0),
      height: SizeConfig.horizontal * 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.description,
            size: SizeConfig.horizontal * 16,
            color: Color(0xFFD6D6D6),
          ),
          Text(
            'Stiamo analizzando\nla tua pratica',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.horizontal * 5,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: SizeConfig.horizontal * 2.8,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ForwardButton(
                fontSizeLabel: SizeConfig.horizontal * 3.7,
                fontSizeIcon: SizeConfig.horizontal * 6,
                label: "Calle Perdomo 20",
                reverse: true,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[Icon(Icons.description), Icon(Icons.search)],
    );
  }
}

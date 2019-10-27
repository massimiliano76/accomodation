import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key key,
    this.cardUrl,
  }) : super(key: key);

  final String cardUrl;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.horizontal * 11,
      width: SizeConfig.horizontal * 17,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.horizontal * 2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(cardUrl),
        ),
      ),
    );
  }
}

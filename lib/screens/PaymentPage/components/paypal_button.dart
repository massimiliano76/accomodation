import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class PaypalButton extends StatelessWidget {
  const PaypalButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: Color(0xFFFFC43A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: CachedNetworkImage(
              imageUrl:
                  'https://cdn.pixabay.com/photo/2015/05/26/09/37/paypal-784404_960_720.png',
              imageBuilder: (context, imageProvider) => Container(
                child: Image(
                  height: SizeConfig.horizontal * 12,
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

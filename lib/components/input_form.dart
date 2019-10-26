import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  InputForm(
      {this.placeholder, this.textInputType, this.isObscured, this.label});

  final String placeholder;
  final String label;
  final TextInputType textInputType;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.horizontal * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label == null
              ? SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.horizontal * 3.5,
                    ),
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x55777777),
                  blurRadius: 5.0,
                  offset: Offset(2, 2),
                )
              ],
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: TextField(
              obscureText: isObscured ?? false,
              keyboardType: textInputType,
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 15,
                  bottom: SizeConfig.horizontal * 10,
                ),
                hintStyle: TextStyle(
                  color: Color(0xAA707070),
                  fontWeight: FontWeight.w300,
                ),
                hintText: placeholder ?? "",
                suffixIcon: Icon(
                  Icons.email,
                  color: Color(0xFF707070),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                filled: true,
                fillColor: Color(0xFFF4F4F4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

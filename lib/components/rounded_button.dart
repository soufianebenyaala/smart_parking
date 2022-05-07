import 'package:flutter/material.dart';
import 'package:smartparkingv2/constants.dart';

class RoundedButton extends StatelessWidget {
  
  final String text;
  final double fontSize;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double margin;
  final double width;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    this.width= 200,
    this.borderRadius= 20,
    this.paddingVertical= 20,
    this.paddingHorizontal= 40,
    this.fontSize= 14,
    this.margin= 10,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });
//Size size = MediaQuery.of(context).size;
//size.width * 0.8
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: newElevatedButton(context),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton(context) {
    return ElevatedButton(
      
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: () => press(context),
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
          textStyle: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500)),
    );
  }
}

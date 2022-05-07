import 'package:flutter/material.dart';
import 'package:smartparkingv2/constants.dart';

class SecondAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color themeColor;

  SecondAppBar({ 
    this.themeColor = kPrimaryColor,
  });

  @override
  SecondAppBarState createState() => SecondAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class SecondAppBarState extends State<SecondAppBar> {

  @override 
  Widget build(BuildContext context) {
    return AppBar(
        title: Text("Parking App",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor)),
        /*IconFont(
          iconName: IconFontHelper.LOGO,
          color: widget.themeColor,
          size: 40
        ),*/
         leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 25,
            color: kPrimaryColor,
          )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: widget.themeColor),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10),
            child: ClipOval(
              child: Image.asset('assets/images/user.png')
            )
          )
        ],
      );
  }
}
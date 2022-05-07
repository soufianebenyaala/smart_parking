import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartparkingv2/constants.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color themeColor;

  MainAppBar({ 
    this.themeColor = kPrimaryColor,
  });

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {

  @override 
  Widget build(BuildContext context) {
    return AppBar(

        title: Text("Parking App",style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor)),
        /*IconFont(
          iconName: IconFontHelper.LOGO,
          color: widget.themeColor,
          size: 40
        ),*/
        backgroundColor: KBackgroundcolor,
        //foregroundColor: KBackgroundcolor,
        elevation: 0.0,
        iconTheme: IconThemeData(color: widget.themeColor),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset('assets/icons/parking_lots.svg',width: 40,)
          
          )
        ],
      );
  }
}
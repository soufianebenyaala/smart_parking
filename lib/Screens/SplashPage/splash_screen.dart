
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartparkingv2/constants.dart';

class SplashPage extends StatefulWidget {
  int duration = 0;
  Widget goTopage;

  SplashPage({required this.duration,required this.goTopage });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.widget.duration),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget.goTopage ));
    });

    return Scaffold(
      body:  Container(
        color: kPrimaryColor,
        child:Center(
          child: Lottie.asset("assets/parking-concept.json"),
        ),
      ),
    );
  }
}

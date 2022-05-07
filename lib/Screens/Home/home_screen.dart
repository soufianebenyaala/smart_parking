import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Home/components/body.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundcolor,
      body: Body(),
    );
  }
}
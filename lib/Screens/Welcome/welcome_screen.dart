import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
final void Function(bool) onLoginChange;

  const WelcomeScreen({required this.onLoginChange});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(onLoginChange: this.onLoginChange),
    );
  }
}
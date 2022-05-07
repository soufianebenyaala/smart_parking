import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/UserProfile/components/user_profile_body.dart';
import 'package:smartparkingv2/models/user.dart';
import 'package:smartparkingv2/services/user_manager.dart';

import '../../constants.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User _user;
    _user = UserManager.currentUser!;
    print(_user.name);
    return Scaffold(
      backgroundColor: KBackgroundcolor,
      body: Body(user : _user),
    );
  }
}
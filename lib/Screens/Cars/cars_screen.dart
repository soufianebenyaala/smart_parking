import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Cars/components/body.dart';
import 'package:smartparkingv2/models/car.dart';
import 'package:smartparkingv2/services/api_manger.dart';
import 'package:smartparkingv2/services/shared_prefes_manager.dart';

import '../../constants.dart';

class CarsScreen extends StatefulWidget {
  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
   List<Car>? _cars;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    getcars();
  }

  Future<void> getcars() async {
    print(SharedPrefsManager.getUser());
    _cars = await ApiManager.getcars(SharedPrefsManager.getUser());
    if (_cars != null) {
      setState(() {
        _isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundcolor,
      body: CarsScreenBody(cars : _cars),
    );
  }
}
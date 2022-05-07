import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Resarvation/components/body.dart';
import 'package:smartparkingv2/models/parking.dart';
import 'package:smartparkingv2/models/reservation.dart';
import 'package:smartparkingv2/services/api_manger.dart';
import 'package:smartparkingv2/services/shared_prefes_manager.dart';

import '../../constants.dart';

class ReservationScreen extends StatefulWidget {


  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
    List<Reservation>? _reservations;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    getcars();
  }

  Future<void> getcars() async {
    _reservations = await ApiManager.getreservationByUser(SharedPrefsManager.getUser(),"CHECKEDOUT");
    if (_reservations != null) {
      setState(() {
        _isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KBackgroundcolor,
      body: ReservationScreenBody(reservations:_reservations),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Resarvation/components/date_time_field.dart';
import 'package:smartparkingv2/Screens/validation/validation.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:smartparkingv2/layouts/parking_layout.dart';
import 'package:smartparkingv2/models/parking.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:smartparkingv2/services/api_manger.dart';
import 'package:smartparkingv2/services/user_manager.dart';

class FormsReservationScreen extends StatefulWidget {
  Parking parking;
  FormsReservationScreen(this.parking);

  @override
  State<FormsReservationScreen> createState() => _FormsReservationScreenState();
}

class _FormsReservationScreenState extends State<FormsReservationScreen> {
  final formKey = GlobalKey<FormState>();
  //key for form
  TextEditingController _positionController = TextEditingController();
  TextEditingController _datetimeController = TextEditingController();
  late DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: KBackgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Form(
          key: formKey, //key for form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              Text(
                "Here to Get You Reservation",
                style: TextStyle(fontSize: 27, color: Color(0xFF363f93)),
              ),
              Text(
                "Welcomed !",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter your Postion"),
                validator: (value) {
                  Validation.validateName(value);
                },
                controller: _positionController,
              ),
              BasicDateTimeField(datetimeController: _datetimeController),
              RoundedButton(
                width: size.width * 0.8,
                color: kPrimaryColor,
                text: "Reserve maintenant",
                textColor: Colors.white, //createResarvation
                press: (context) async {
                  await ApiManager.createResarvation(
                          _datetimeController.text,
                          _positionController.text,
                          UserManager.currentUser!.id,
                          widget.parking.id)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ParkingLayout()),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

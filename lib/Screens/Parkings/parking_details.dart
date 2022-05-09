import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Reclamation/reclamation_screen.dart';
import 'package:smartparkingv2/Screens/Resarvation/forms_resevation_screen.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:smartparkingv2/models/parking.dart';

class ParkingDetailsScreen extends StatelessWidget {
  Parking parking;
  ParkingDetailsScreen(this.parking);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/car.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(34))),
                child: Column(
                  children: [
                    _titleSection(parking),
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    _infoSection(parking),
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    RoundedButton(
                      width: size.width * 0.8,
                      color: kPrimaryColor,
                      text: "Reserve maintenant",
                      textColor: Colors.white,
                      press: (context) async  {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormsReservationScreen(parking)),
                        );
                      },
                    ),
                    RoundedButton(
                      width: size.width * 0.8,
                      color: Colors.red,
                      text: "Reclamation",
                      textColor: Colors.white,
                      press: (context) async  {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReclamationScreen(parking)),
                        );
                      },
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  /// Info Section
  Row _infoSection(parking) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _infoCell(title: 'lots', value: parking.totalParkingLots.toString()),
        Container(
          width: 1,
          height: 40,
          color: Colors.grey,
        ),
        _infoCell(
            title: 'Free lots', value: parking.totalFreeParkingLots.toString()),
        Container(
          width: 1,
          height: 40,
          color: Colors.grey,
        ),
        _infoCell(title: 'Cost', value: "TND" + parking.parkingFees.toString()),
      ],
    );
  }

  /// Info Cell
  Column _infoCell({required String title, required String value}) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection(parking) {
    return Column(
      children: <Widget>[
        Text(
          parking.name,
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          parking.adress,
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

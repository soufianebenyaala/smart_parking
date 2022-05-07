import 'package:flutter/material.dart';

import '../../../constants.dart';

class ParkingCard extends StatelessWidget {
  var parking;
  Function onCardClick;

  ParkingCard({this.parking, required this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onCardClick(context),
        child: Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            color: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            //shadowColor: Colors.grey,
            child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/car.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.3)
                            ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(this.parking.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 27)),
                            Spacer(),
                            Text(this.parking.parkingFees.toString() + " TND",
                                style: TextStyle(
                                    color: kPrimaryLightColor,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.pin_drop, color: Colors.red[900]),
                            Text(this.parking.adress,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(
                            "Free Parking Lots :" +
                                this.parking.totalFreeParkingLots.toString(),
                            style: TextStyle(
                                color: kPrimaryLightColor, fontSize: 20)),
                      ],
                    )))));
  }
}

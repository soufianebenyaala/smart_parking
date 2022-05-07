import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Parkings/components/parking_card.dart';
import 'package:smartparkingv2/Screens/Parkings/parking_details.dart';
import 'package:smartparkingv2/models/parking.dart';

class Body extends StatelessWidget {
  List<Parking>? parkings;
  Body({required this.parkings});
  //List<Parking> parkings = ParkingsPreferences.parkings;
  
  @override
  Widget build(BuildContext context)  {
    return Container(
        color: Colors.black12,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text('Select un parking:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black)),
        ),
        Expanded(
          child: parkings != null ? ListView.builder(
            itemCount:  parkings!.length,
            itemBuilder: (context, index) {
              return ParkingCard(
                  parking: parkings![index],
                  onCardClick: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParkingDetailsScreen(parkings![index])),
                    );
                  });
            },
          ):  Center(child: CircularProgressIndicator(),)
        ),
      ],
    ));
  }
}

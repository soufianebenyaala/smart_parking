import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Resarvation/components/checkout_resevation_card.dart';
import 'package:smartparkingv2/Screens/Resarvation/components/resevation_card.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/constants.dart';

class ReservationPanierScreenBody extends StatelessWidget {
  var reservations;
  ReservationPanierScreenBody({ this.reservations});

  @override
  Widget build(BuildContext context) {
    print("reservations");
    print(reservations);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Reservations",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: kPrimaryColor)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: reservations != null
                      ? reservations != []
                          ? ListView.builder(
                              itemCount: reservations.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return CheckoutReservationCard(
                                  reservation: reservations[index],
                                );
                              },
                            )
                          : Center(child: Text("No reservation"))
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}

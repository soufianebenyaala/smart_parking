import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:smartparkingv2/layouts/parking_layout.dart';
import 'package:smartparkingv2/models/reservation.dart';
import 'package:flutter/material.dart';
import 'package:smartparkingv2/services/api_manger.dart';
import 'package:intl/intl.dart';

class CheckoutReservationCard extends StatefulWidget {
  Reservation reservation;
  CheckoutReservationCard({required this.reservation});

  @override
  State<CheckoutReservationCard> createState() =>
      _CheckoutReservationCardState();
}

class _CheckoutReservationCardState extends State<CheckoutReservationCard> {
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd HH:mm");
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        elevation: 5.0,
        //shape: RoundedRectangleBorder(
        //  borderRadius: BorderRadius.circular(10.0)
        //),
        child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.bookmark_add,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Reservation at position : " +
                              widget.reservation.position.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            //color: kRetailerWhite
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Starting date : " +
                              format.format(
                                  widget.reservation.startingDate as DateTime),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            //color: kRetailerLightPrimary
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          //openDialog(context, widget.car);
                        },
                        child: Row(
                          children: [
                            Text(
                              "See more",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: kPrimaryColor,
                              size: 14,
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedButton(
                      width: size.width * 0.3,
                      margin: 0,
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      color: Colors.red,
                      text: "Cancel",
                      textColor: Colors.white,
                      press: (context) async{
                        if (widget.reservation.Id != null) {
                         await ApiManager.resarvationdelete(widget.reservation.Id ?? "none")
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParkingLayout()),
                            );
                          });
                        }
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    RoundedButton(
                      width: size.width * 0.3,
                      margin: 0,
                      paddingHorizontal: 0,
                      paddingVertical: 0,
                      color: kPrimaryColor,
                      text: "CheckOut",
                      textColor: Colors.white,
                      press: (context) async {
                        if (widget.reservation.Id != null) {
                          await ApiManager.resarvationUpdate(widget.reservation.Id ?? "none")
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ParkingLayout()),
                          );
                        });
                        }
                      },
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

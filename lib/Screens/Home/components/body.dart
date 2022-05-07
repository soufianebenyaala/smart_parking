import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Home/components/home_card.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:smartparkingv2/services/user_manager.dart';

import '../../Parkings/parkings_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserManager.currentUser != null
                ? Text(
                    "Hello " + UserManager.currentUser!.name.toString() + ",",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 29,
                        color: kPrimaryColor),
                  )
                : Text(
                    "Hello,",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 29,
                        color: kPrimaryColor),
                  ),
            Text(
              "Find Your parking,",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 36,
                  color: kPrimaryColor),
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset("assets/images/parking.png"),
            Spacer(),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: RoundedButton(
                  width: MediaQuery.of(context).size.width,
                  press: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingsScreen();
                        },
                      ),
                    );
                  },
                  text: "Click Here And Reserve Your Spot"),
            )
            /*Expanded(
                child: 
                GridView.count(
              crossAxisCount: 2,
              children: [
                HomeCard(
                  press: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingsScreen();
                        },
                      ),
                    );
                  },
                  svgSrc: 'assets/icons/road03.svg',
                  title: 'Parkings',
                ),
                HomeCard(
                  press: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingsScreen();
                        },
                      ),
                    );
                  },
                  svgSrc: 'assets/icons/user_flat.svg',
                  title: 'Profile',
                ),
                HomeCard(
                  press: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingsScreen();
                        },
                      ),
                    );
                  },
                  svgSrc: 'assets/icons/car1.svg',
                  title: 'Cars',
                ),
                HomeCard(
                  press: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingsScreen();
                        },
                      ),
                    );
                  },
                  svgSrc: 'assets/icons/ShoppingCart.svg',
                  title: 'Reservation',
                ),
              ],
            ))*/
          ],
        ));
  }
}

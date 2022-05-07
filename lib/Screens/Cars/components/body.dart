import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Cars/cars_screen.dart';
import 'package:smartparkingv2/Screens/Cars/components/car_card.dart';
import 'package:smartparkingv2/components/textfield_widget.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:smartparkingv2/layouts/parking_layout.dart';
import 'package:smartparkingv2/models/car.dart';
import 'package:smartparkingv2/services/api_manger.dart';
import 'package:smartparkingv2/services/shared_prefes_manager.dart';
import 'package:smartparkingv2/services/user_manager.dart';

class CarsScreenBody extends StatelessWidget {
  var cars;
  CarsScreenBody({this.cars});

  TextEditingController _typeController = TextEditingController();
  TextEditingController _numbreController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //List<Car> cars = UserPreferences.user.cars;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Cars",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: kPrimaryColor)),
              FloatingActionButton(
                onPressed: () async {
                  await AddCar(context);
                },
                tooltip: 'Increment',
                backgroundColor: kPrimaryColor,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
               child: cars != null ? ListView.builder(
                 itemCount:  cars.length,
                 scrollDirection: Axis.vertical,
                 shrinkWrap: true,
                  itemBuilder: (context, index) {
                   return CarCard(
                     car: cars[index],
                   );
                 },
               ):  Center(child: CircularProgressIndicator(),)
              )
        ])),
      ),
    );
  }

  Future AddCar(context) => showDialog(
        context: context,
        // ignore: missing_return
        builder: (context) { 
        return  AlertDialog(
          scrollable: true,
          title: Text("Add"),
          actions: [TextButton(onPressed: () {
            ApiManager.addCar(
                    _typeController.text, _numbreController.text, _descriptionController.text);
                print("addcar");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ParkingLayout();
                    },
                  ),
                );
          }, child: Text("Add Car"))],
          content: Form(
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Type',
                  controller: _typeController,
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Numbre',
                  controller: _numbreController,
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Description',
                  maxLines: 5,
                  controller: _descriptionController,
                ),
              ],
            ),
          ),
        );}
      );
}

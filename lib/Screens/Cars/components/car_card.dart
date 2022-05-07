import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/components/textfield_widget.dart';
import 'package:smartparkingv2/layouts/parking_layout.dart';
import 'package:smartparkingv2/services/api_manger.dart';
import 'package:flutter/material.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:smartparkingv2/models/car.dart';

class CarCard extends StatefulWidget {
  Car car;
  CarCard({required this.car});

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  TextEditingController _numberController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _numberController.text = widget.car.number ?? "";
    _typeController.text = widget.car.type ?? "";
    _descriptionController.text = widget.car.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        width: MediaQuery.of(context).size.width,
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: KBackgroundcolorCard,),
        child: Row(
          children: [
            Icon(
              Icons.car_repair_sharp,
              size: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.car.type ?? "None",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    //color: kRetailerWhite
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.car.number ?? "None",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    //color: kRetailerLightPrimary
                  ),
                )
              ],
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  openDialog(context, widget.car);
                },
                child: Row(
                  children: [
                    Text(
                      "See more",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Future openDialog(context, car) => showDialog(
      context: context,
      // ignore: missing_return
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return AlertDialog(
          scrollable: true,
          title: Text("detail car"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundedButton(
                  paddingHorizontal: 0,
                  paddingVertical: 0,
                  margin: 0,
                  borderRadius: 5,
                  width: size.width * 0.2,
                  text: "Delete",
                  press: (context) async {
                    await openDeleteDialog(context);
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                RoundedButton(
                  paddingHorizontal: 0,
                  paddingVertical: 0,
                  margin: 0,
                  width: size.width * 0.2,
                  borderRadius: 5,
                  text: "Edit",
                  press: (context) async {
                    await openEditDialog(context, car);
                  },
                  //color: kPrimaryLightColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
          content: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Type : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        //label: 'number',
                        car.type,
                        style: TextStyle(fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Number : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //label: 'type',
                      car.number,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Description : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //label: 'description',
                      car.description,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });

  Future openEditDialog(context, car) => showDialog(
      context: context,
      // ignore: missing_return
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text("Edit Profile"),
          actions: [
            Center(
              child: RoundedButton(
                borderRadius: 30,
                text: "Edit",
                press: (context) async {
                  await ApiManager.carUpdate(
                          _numberController.text,
                          _descriptionController.text,
                          _typeController.text,
                          car.id)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingLayout();
                        },
                      ),
                    );
                  });
                },
                color: kPrimaryColor,
                textColor: Colors.white,
              ),
            )
          ],
          content: Form(
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'type',
                  controller: _typeController,
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'number',
                  controller: _numberController,
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'description',
                  controller: _descriptionController,
                ),
              ],
            ),
          ),
        );
      });

  Future openDeleteDialog(context) => showDialog(
      context: context,
      // ignore: missing_return
      builder: (context) {
        return AlertDialog(
            scrollable: true,
            title: Center(child: Text("Delete")),
            actions: [
              Center(
                child: RoundedButton(
                  text: "Delete",
                  press: (context) async {
                    await ApiManager.DeleteCar(widget.car.id).then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ParkingLayout();
                          },
                        ),
                      );
                    });
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              )
            ],
            content: Center(child: Text("are you shur !!!")));
      });
}

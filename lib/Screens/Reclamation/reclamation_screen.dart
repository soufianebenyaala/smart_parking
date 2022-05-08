import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/validation/validation.dart';
import 'package:smartparkingv2/components/mainappbar.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/models/parking.dart';
import 'package:smartparkingv2/services/api_manger.dart';
import 'package:smartparkingv2/services/user_manager.dart';

import '../../constants.dart';

class ReclamationScreen extends StatefulWidget {
  Parking parking;
  ReclamationScreen(this.parking);

  @override
  State<ReclamationScreen> createState() => _ReclamationScreenState();
}

class _ReclamationScreenState extends State<ReclamationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = UserManager.currentUser!.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: MainAppBar(),
        //backgroundColor: KBackgroundcolor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height * 0.85,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: height * 0.04),
                        Text(
                          "Here to Get You Reclamation",
                          style:
                              TextStyle(fontSize: 27, color: Color(0xFF363f93)),
                        ),
                        Text(
                          "Welcomed !",
                          style:
                              TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                        ),
                        //SizedBox(height: height * 0.05,),
                      ],
                    ),

                    TextFormField(
                      decoration: InputDecoration(labelText: "Enter your Name"),
                      validator: (value) => Validation.validateName(value),
                      controller: _nameController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Email"),
                      validator: (value) => Validation.validateName(value),
                      controller: _emailController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Address"),
                      validator: (value) => Validation.validateName(value),
                      controller: _addressController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Status"),
                      validator: (value) => Validation.validateName(value),
                      controller: _statusController,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter your Description"),
                      validator: (value) => Validation.validateName(value),
                      controller: _descriptionController,
                      maxLines: 2,
                    ),
                    //Spacer(),
                    RoundedButton(
                      width: size.width * 0.8,
                      color: Colors.red,
                      text: "Reclamation",
                      textColor: Colors.white,
                      press: (context)async {
                        await ApiManager.createReclamation(
                            _nameController.text,
                            _emailController.text,
                            _addressController.text,
                            _descriptionController.text,
                            _statusController.text).then((value) => Navigator.pop(context));
                        
                      },
                    )
                  ],
                ))));
  }
}

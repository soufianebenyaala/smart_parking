import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smartparkingv2/components/button_widget.dart';
import 'package:smartparkingv2/components/profile_widget.dart';
import 'package:smartparkingv2/components/textfield_widget.dart';
import 'package:smartparkingv2/layouts/parking_layout.dart';
import 'package:smartparkingv2/models/user.dart';
import 'package:smartparkingv2/services/user_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../validation/validation.dart';

class Body extends StatefulWidget {
  User user;
  Body({required this.user});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = UserManager.currentUser!.name ?? "";
    _phoneController.text = UserManager.currentUser!.phone ?? "";
    _addressController.text = UserManager.currentUser!.address ?? "";

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath:
              "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
          onClicked: () {
            openPhotoDialog(context, widget.user);
          },
        ),
        const SizedBox(height: 24),
        buildName(widget.user),
        const SizedBox(height: 24),
        Center(
            child: ButtonWidget(
          text: 'Edit profile',
          onClicked: () {
            openDialog(context);
          },
        )),
        const SizedBox(height: 24),
        //const SizedBox(height: 48),
        Row(
          children: [
            widget.user.address != null
                ? BuildContent(data: widget.user.address, label: "address")
                : BuildContent(data: "None", label: "address"),
            widget.user.phone != null
                ? BuildContent(data: widget.user.phone, label: "phone")
                : BuildContent(data: "None", label: "phone"),
          ],
        )
      ],
    );
  }

  Widget buildName(var user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Future openPhotoDialog(context, user) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          scrollable: true,
          title: Text("chose un option"),
          actions: [TextButton(onPressed: () {}, child: Text("submit"))],
          content: Row(
            children: [
              FlatButton.icon(
                onPressed: (){
                  takePhoto(ImageSource.gallery);
                }, 
                icon: Icon(Icons.image,size: 35,), 
                label: Text("Gallery",style: TextStyle(fontSize: 18),)
                ),
                              FlatButton.icon(
                onPressed: (){
                  takePhoto(ImageSource.camera);
                }, 
                icon: Icon(Icons.camera,size: 35,), 
                label: Text("Camera",style: TextStyle(fontSize: 18),)
                ),


              /*Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  )
                ],
              ),*/
            ],
          )));

  Future openDialog(context) => showDialog(
      context: context,
      // ignore: missing_return
      builder: (context) {
        final _formKey = GlobalKey<FormState>();
        return AlertDialog(
          scrollable: true,
          title: Text("Edit Profile"),
          actions: [
            TextButton(
                onPressed: () {
                  if ( _formKey.currentState!.validate()) {
                  UserManager.UserUpdate(_nameController.text,
                          _addressController.text, _phoneController.text)
                      .then((value) {
                    UserManager.initialize();
                    print("Edit Profile");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ParkingLayout();
                        },
                      ),
                    );
                  });
                  }else{
                      return;
                    }
                },
                child: Text("Edit"))
          ],
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Name',
                  controller: _nameController,
                  validator: (value) =>Validation.validateName(value)
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone',
                  controller: _addressController,
                  validator: (value) =>Validation.validateName(value)
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Address',
                  controller: _phoneController,
                  validator: (value) =>Validation.validateName(value)
                ),
              ],
            ),
          ),
        );
      });

  void takePhoto(ImageSource source) async  {
    File? image;
      XFile?  pickedFile =
        await _picker.pickImage(source: source);
    if(pickedFile != null){
         image = File(pickedFile.path);
    }
    setState(() {
      _image = image;
    });
  }
}

class BuildContent extends StatelessWidget {
  final data;
  final label;
  BuildContent({
    this.data,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            data,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
}

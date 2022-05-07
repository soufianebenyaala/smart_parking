import 'package:flutter/material.dart';
import 'package:smartparkingv2/components/text_field_container.dart';
import 'package:smartparkingv2/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  String? Function(dynamic value) validator;
  RoundedInputField({
    required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    required this.validator, 

  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator:validator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

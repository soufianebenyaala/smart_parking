import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController controller;
  final int maxLines;
  final String label;
  final String? text;
  final ValueChanged<String>? onChanged;

  final  validator;

  TextFieldWidget({
    this.maxLines = 1,
    required this.controller,
    required this.label,
    this.text,
    this.onChanged,
    required this.validator,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  

  //@override
  //void initState() {
  //  super.initState();
//
  //  wcontroller = TextEditingController(text: widget.text);
  //}
//
  //@override
  //void dispose() {
  //  controller.dispose();
//
  //  super.dispose();
  //}

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: widget.maxLines,
            validator:widget.validator
          ),
        ],
      );
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldContainer extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final validator;

  TextFormFieldContainer({
    this.hintText,
    this.labelText,
    this.textInputAction,
    this.controller,
    this.validator,
  });

  @override
  _TextFormFieldContainerState createState() => _TextFormFieldContainerState();
}

class _TextFormFieldContainerState extends State<TextFormFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff009688),
      ),
      child: Center(
        child: TextFormField(
          cursorColor: Colors.black,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          controller: widget.controller,
          textInputAction: TextInputAction.send,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            border: InputBorder.none,
            hintText: 'Enter your input here',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

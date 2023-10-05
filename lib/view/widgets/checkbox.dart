
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 18.0,
        height: 18.0,
        decoration: BoxDecoration(
          border: isChecked
              ? null // No border when isChecked is true
              : Border.all(
            color: Colors.black54, // Light black border color
          ),
          borderRadius: BorderRadius.circular(4.0), // Border radius for a rounded appearance
        ),
        child: isChecked
            ? Icon(
          Icons.check,
          size: 18.0,
          color: Colors.black, // Black tick color
        )
            : null, // Show the black tick when isChecked is true
      ),
    );
  }
}
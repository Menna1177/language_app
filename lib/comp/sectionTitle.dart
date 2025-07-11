import 'package:flutter/material.dart';
class sectionTitle extends StatelessWidget {
  String? title;
   sectionTitle({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text("$title",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff046582),
        ),
      ),
    );;
  }
}

import 'package:flutter/material.dart';

class codeBlock extends StatelessWidget {
  String? code;
   codeBlock({super.key , required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Example:\n",style: TextStyle(
            color: Color(0xff046582),
            fontSize: 15,
          ),),
          SelectableText(code!,
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

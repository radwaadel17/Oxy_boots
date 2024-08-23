import 'package:flutter/material.dart';

class TextFielddesign extends StatelessWidget {
   TextFielddesign({super.key , required this.txt , required this.onChanged});
  String txt ; 
   Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '$txt',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: 335,
              height: 48,
             decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
             ),
             child: TextField(
              onChanged: onChanged ,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
             ),
            ),
          ),
      ],
    );
  }
}
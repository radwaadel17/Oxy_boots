import 'package:flutter/material.dart';

class TextFielddesign extends StatelessWidget {
  const TextFielddesign({super.key , required this.txt });
   final String txt ; 
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
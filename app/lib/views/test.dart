import 'package:flutter/material.dart';

class tet extends StatelessWidget {
  const tet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
           height: 201,
           width: 157,
           decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(image: AssetImage('assets/Frame 250.png'))
           ),
        ),
      ],
    );
  }
}
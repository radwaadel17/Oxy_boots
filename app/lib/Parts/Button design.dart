import 'package:flutter/material.dart';

class ButtomDesign extends StatelessWidget {
  const ButtomDesign({super.key , required this.label , required this.onTap});
  final String label ;
  final VoidCallback? onTap ;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(onPressed: onTap,
             child: Text(
              '$label' ,
              style: TextStyle(
                fontSize: 18 , 
                color: Colors.white ,
              ),
              
             ),
             style: ElevatedButton.styleFrom(
              fixedSize: Size(335, 54),
              backgroundColor: Color(0xff5B9EE1)
             ),
             ),
          );
  }
}

import 'package:flutter/material.dart';

class BoardingButton extends StatelessWidget {
  const BoardingButton({super.key, required this.txt});

  final String txt;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        if(txt == 'Start'){
          Navigator.pushNamed(context ,'signin');
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(100, 40),
        backgroundColor: Color(0xff5B9EE1),
      ),
      child: Text(
        txt,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

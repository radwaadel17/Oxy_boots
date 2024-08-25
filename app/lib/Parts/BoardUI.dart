import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:app/models/photo%20slide%20model.dart';
import 'package:flutter/material.dart';


class BoardUi extends StatelessWidget {
  const BoardUi({
    super.key,
    required this.model,
  });

  final PhotoModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Container(
           child: Column(
             children: [
               SizedBox( height: SizeConfig.defaultSize!*50, child: Image.asset('${model.img}')),
                Padding(
                 padding: EdgeInsets.symmetric(horizontal: 24),
                 child: Text( model.txt1 , 
                 style: TextStyle(
                   fontSize: 32,
                   fontWeight: FontWeight.bold ,
                 ),
                 ),
             ),
              Padding(
               padding: EdgeInsets.symmetric(horizontal: 24),
               child: Text(model.tx2 , 
               style: TextStyle(
                 fontSize: 20 , 
                 color: Color(0xff707B81),
               ),
               ),
             ),
            ],
           ),  
       )
     ],
     );
  }
}
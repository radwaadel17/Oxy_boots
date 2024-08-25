import 'package:app/models/photo%20slide%20model.dart';
import 'package:app/Parts/BoardUI.dart';
import 'package:flutter/material.dart';



class OnboardingBuilder extends StatelessWidget {
   OnboardingBuilder({super.key , required this.Controller_id});
   PageController Controller_id ;

   final List<PhotoModel> listPhotos = const [
    PhotoModel(
        img: 'assets/Onboard-2.png',
        tx2: 'There Are Many Beautiful And Attractive Plants To Your Room',
        txt1: 'Follow Latest Style Shoes'),
    PhotoModel(
      img: 'assets/Onboard-3.png',
      tx2: 'Smart, Gorgeous & Fashionable Collection',
      txt1: 'Start Journey With Nike',
    ),
   ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: Controller_id,
      itemCount: listPhotos.length,
      itemBuilder: (context , cnt){
       return BoardUi(model: listPhotos[cnt]);      },
    );
  }
}
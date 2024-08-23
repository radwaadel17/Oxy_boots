import 'package:flutter/material.dart';

class revcoveryPage extends StatelessWidget {
  const revcoveryPage({super.key , required this.cont});
  final TextEditingController cont; 

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    backgroundColor: const Color(0xfff8f9fb),
    body:Column(
      children: [
        SizedBox(height: 170,),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
                      children: [
                        Text(
                          'Recovery Password',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Please Enter Your Email Address To Recieve a Verification Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff707B81),
                            fontSize: 16,
                          ),
                        ),

                      ],
                    ),
          ),
        ),
        SizedBox(height: 50,),
       /*  TextFielddesign(txt: 'Email Address' , t_con:cont ,) ,
                SizedBox(height: 50,),

        ButtomDesign(label: 'Continue', fun: (){},), */
       ],
    ),
    );
  }
}
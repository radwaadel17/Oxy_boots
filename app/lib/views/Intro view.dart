import 'package:app/views/Onboarding%20body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';


class introPage extends StatefulWidget {
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  void goToNextScreen(){
  Future.delayed(Duration(seconds: 3) , (){
    Get.to(()=> OnboardingView(), transition: Transition.fade);
  });
}

  initState(){
    super.initState();
   goToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/df50d4b1469877c7684a72cbf7e0dbde.png'),
                    fit: BoxFit.cover)),
          ),
           Center(
            child: Text(
              'Oxy Boots',
              style: TextStyle(
                  fontSize: 28.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

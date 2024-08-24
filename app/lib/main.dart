import 'dart:io';

import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:app/firebase_options.dart';
import 'package:app/views/Favorite.dart';
import 'package:app/views/HomePage.dart';
import 'package:app/views/Intro%20view.dart';
import 'package:app/views/Sign%20in.dart';
import 'package:app/views/Sign%20up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
Platform.isAndroid? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCrtuJlSkqPLaQtJQQGY1VztDvA1c7q7cQ",
      appId: "1:476402096447:android:aeb941c0587288c93f1b8a",
      messagingSenderId: "476402096447",
      projectId: "shosestore-60804",
    ),
)
  :await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const shoesStore());
}
class shoesStore extends StatelessWidget {
  const shoesStore({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      child: GetMaterialApp(
        routes: {
          'intro': (context) => introPage(),
          'signin': (context) => signIn(),
          'signup': (context) => signUp(),
          'hm': (context) => HomePage(),
          'fav' :(context) => FavoriteView(),
        },
        debugShowCheckedModeBanner: false,
        home: const introPage(),
      ),
    );
  }
}


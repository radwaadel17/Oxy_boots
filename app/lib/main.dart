import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:app/firebase_options.dart';
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
  await Firebase.initializeApp(
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
        },
        debugShowCheckedModeBanner: false,
        home: const introPage(),
      ),
    );
  }
}


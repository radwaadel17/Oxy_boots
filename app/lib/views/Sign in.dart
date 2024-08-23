import 'package:app/Parts/Button%20design.dart';
import 'package:app/Parts/input%20text%20design.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

String? email;
String? password;
bool Isloading = false;
bool Iscorrect = true;

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Isloading,
      child: Scaffold(
        backgroundColor: const Color(0xfff8f9fb),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
            ),
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Hello Again!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Welcome Back You’ve Been Missed!',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            TextFielddesign(
              onChanged: (data) {
                email = data;
              },
              txt: 'Email Address',
            ),
            const SizedBox(
              height: 40,
            ),
            TextFielddesign(
              onChanged: (data) {
                password = data;
              },
              txt: 'Password',
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'rec');
                },
                child: const Text(
                  'Recovery Password',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xff707B81),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtomDesign(
                label: 'Sign In',
                onTap: () async {
                  Isloading = true;
                  setState(() {});
                  try {
                    await loginUser();
                    showSnackbar(context, 'Success Login');
                    Navigator.pushNamed(context, 'hm');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showSnackbar(context, 'No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      showSnackbar(
                          context, 'Wrong password provided for that user.');
                      //print('Wrong password provided for that user.');
                    }
                  } catch (e) {
                    showSnackbar(context, 'there was an error');
                  }
                  Isloading = false;
                  setState(() {});
                }),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: Container(
                  width: 335,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 20,
                          child:
                              Image(image: AssetImage('assets/Group 108.png'))),
                      Text(
                        ' Sign in with google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
                  style: TextStyle(
                    color: Color(0xff707B81),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: const Text(
                    ' Sign Up for free',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}

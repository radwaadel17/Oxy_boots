import 'package:app/Parts/Button%20design.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class revcoveryPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  revcoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fb),
      body: Column(
        children: [
          SizedBox(
            height: 170,
          ),
          const Center(
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
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Email Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: 335,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ButtomDesign(
              label: 'Continue',
              onTap: () async {
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailController.text);
                  showSnackbar(context, 'Passowrd recovery sent');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else {
                    print('Failed to send password reset email: $e');
                  }
                }
              }),
        ],
      ),
    );
  }

  Future<void> resetPassword(String email) async {}
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

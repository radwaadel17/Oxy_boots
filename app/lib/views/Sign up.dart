import 'package:app/Parts/Button%20design.dart';
import 'package:app/Parts/input%20text%20design.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  String? name ;
  String? email ;
  String? Password ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fb),
      body: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Let’s Create Account Together',
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
            onChanged: (data){
             name = data ;
            },
            txt: 'Your Name',
          ),
          const SizedBox(
            height: 40,
          ),
          TextFielddesign(
            onChanged: (data){
              email  = data ;
            },
            txt: 'Email Address',
          ),
          const SizedBox(
            height: 40,
          ),
          TextFielddesign(
            onChanged: (data){
              Password = data; 
            },
            txt: 'Password',
          ),
          const SizedBox(
            height: 40,
          ),
          ButtomDesign(
            label: 'Sign Up',
            onTap: (){
             var auth = FirebaseAuth.instance;
             auth.createUserWithEmailAndPassword(
              email: email!, 
              password: Password!);
            },
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: Color(0xff707B81),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  ' Sign in',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

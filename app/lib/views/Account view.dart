import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String name = 'not set';
  String? email = 'not set';
  String? password = 'not set';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserData();
  }

   Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Not set';
      email = prefs.getString('email') ?? 'Not set';
      password = prefs.getString('password') ?? 'Not set';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 35),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child:
                  SizedBox(height: 24, child: Image.asset('assets/IconP.png')),
            ),
          ],
        ),
        backgroundColor: const Color(0xfff8f9fb),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black),
                ),
                Positioned(
                    bottom: -39,
                    left: 10,
                    right: 10,
                    child: SizedBox(
                        height: 80,
                        child: GestureDetector(
                            child: Image.asset('assets/Group 289.png')))),
              ]),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              container(txt: name!,),
              SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
             container(txt: email!,),
              SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              container(txt: password!,),
            ],
          ),
        ));
  }
}

// ignore: camel_case_types
class container extends StatelessWidget {
   final String txt ;
  const container({
    
    super.key,
    required this.txt,
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        width: 335,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

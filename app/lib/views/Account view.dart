import 'package:app/views/Sign%20in.dart';
import 'package:app/views/Sign%20up.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('$email'),
          ],
        ),
      ),
    );
  }
}

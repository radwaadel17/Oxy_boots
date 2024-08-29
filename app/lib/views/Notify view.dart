import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifyView extends StatelessWidget {
  const NotifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fb),
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f9fb),
        title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text(
                        'Notifications',
                        style: TextStyle(),
                      ),
            )),
      ),
      body: Stack(
       children: [ ListView(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            containerNotfication(
                img: 'assets/Group 158.png',
                Price1: 364.95,
                Price2: 260.00,
                txt1: 'We Have New',
                txt2: 'Products with offers', date: '6min',),
            SizedBox(
              height: 15,
            ),
            containerNotfication(
                img: 'assets/Group 156.png',
                Price1: 364.00,
                Price2: 260.00,
                txt1: 'We Have New',
                txt2: 'Products with offers', date: '24min',),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Yestday',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            containerNotfication(
                img: 'assets/Group 157.png',
                Price1: 364.95,
                Price2: 260.00,
                txt1: 'We Have New',
                txt2: 'Products with offers', date:  '3days'),
            SizedBox(
              height: 15,
            ),
            containerNotfication(
                img: 'assets/Group 155.png',
                Price1: 364.95,
                Price2: 260.00,
                txt1: 'We Have New',
                txt2: 'Products with offers', date: '3days',),
          ],
        ),
       Positioned(
        right: 24,
        bottom: 450,
         child: SizedBox(
          height: 10,
          child: Image.asset('assets/Ellipse 891.png')),
       ),
        Positioned(
        right: 24,
        bottom: 550,
         child: SizedBox(
          height: 10,
          child: Image.asset('assets/Ellipse 891.png')),
       )
       ],
      ),
    );
  }
}

class containerNotfication extends StatelessWidget {
  const containerNotfication(
      {super.key,
      required this.img,
      required this.Price1,
      required this.Price2,
      required this.txt1,
      required this.txt2 ,
      required this.date ,
      });
  final String img;
  final txt1;
  final String txt2;
  final double Price1;
  final double Price2;
  final String date ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 330,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(img),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Text(
                  txt1,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                child: Text(
                  txt2,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                child: Row(
                  children: [
                    Text('\$$Price1'),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '\$$Price2',
                      style: TextStyle(
                          color: Color(0xff707B81),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(date , style: TextStyle(fontSize: 10),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

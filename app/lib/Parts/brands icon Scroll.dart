import 'package:flutter/material.dart';

class BrandsIcon extends StatelessWidget {
  const BrandsIcon({super.key});
  final List<String> img = const [
    'assets/Group 6 (1).png',
    'assets/Frame 11.png',
    'assets/Frame 10.png',
    'assets/Frame 9 (1).png',
    'assets/Frame 8.png',
  ];
  final int selectedIndex = 0; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 76,
        width: 335,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: img.length,
          
          itemBuilder: (context, cnt) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Image.asset(img[cnt])),
            );
          },
        ),
      ),
    );
  }
}


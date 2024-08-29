import 'package:flutter/material.dart';

class BrandsIcon extends StatefulWidget {
  const BrandsIcon({super.key});

  @override
  State<BrandsIcon> createState() => _BrandsIconState();
}

class _BrandsIconState extends State<BrandsIcon> {
  final List<String> img = const [
    'assets/Group 6 (1).png',
    'assets/Frame 11.png',
    'assets/Frame 10.png',
    'assets/Frame 9 (1).png',
    'assets/Frame 8.png',
  ];

  final List<String> brandNames = const [
    'Nike',
    'Puma',
    'Under Armour',
    'Adidas',
    'Converse',
  ];

  int selectedIndex = 0;  // Initially selected index

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 76,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: img.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: isSelected
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(img[index]),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              brandNames[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(img[index]),
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}

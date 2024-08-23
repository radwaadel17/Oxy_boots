import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
            height: SizeConfig.defaultSize! * 4,
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: EdgeInsets.all(5),
            width: 335,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Looking for shoes',
                hintStyle: TextStyle(
                  color: Color(0xff707B81),
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
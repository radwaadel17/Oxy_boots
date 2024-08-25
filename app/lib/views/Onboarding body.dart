import 'package:app/Parts/customBoardingButton.dart';
import 'package:app/core/utlis/size%20config%20model.dart';
import 'package:app/Parts/Onboarding%20Builder.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';


class OnboardingView extends StatefulWidget {
  OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = _pageController.hasClients ? _pageController.page ?? 0 : 0;
    return Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      body: Stack(
        children: [
          OnboardingBuilder(Controller_id:  _pageController),
          Positioned(
            top: SizeConfig.defaultSize! * 75,
            right: 32,
            child: BoardingButton(
              txt: currentPage.round() == 1 ? 'Start' : 'Next',
            ),
          ),
          Positioned(
              top: SizeConfig.defaultSize! * 77,
              left: 32,
              child: SmoothPageIndicator(
                controller:_pageController,
                count: 2,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Color(0xff5B9EE1),
                ),
            )),
        ],
      ),
    );
  }
}

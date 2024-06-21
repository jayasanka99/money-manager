import 'package:flutter/material.dart';
import 'package:money_app/constant/colors.dart';
import 'package:money_app/constant/kpadding.dart';
import 'package:money_app/data/onboarding_data.dart';
import 'package:money_app/screens/register_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/custom_btn.dart';
import 'onboarding_screen/front_page.dart';
import 'onboarding_screen/shared_onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (index) {
                      setState(() {
                        isLastPage = index == 3;
                      });
                    },
                    controller: _controller,
                    children: [
                      const FrontPage(),
                      SharedOnboarding(
                        title: OnboardingData.onboardingDataList[0].title,
                        desc: OnboardingData.onboardingDataList[0].desc,
                        image: OnboardingData.onboardingDataList[0].image,
                      ),
                      SharedOnboarding(
                        title: OnboardingData.onboardingDataList[1].title,
                        desc: OnboardingData.onboardingDataList[1].desc,
                        image: OnboardingData.onboardingDataList[1].image,
                      ),
                      SharedOnboarding(
                        title: OnboardingData.onboardingDataList[2].title,
                        desc: OnboardingData.onboardingDataList[2].desc,
                        image: OnboardingData.onboardingDataList[2].image,
                      ),
                    ],
                  ),
                  Container(
                    alignment: const Alignment(0, 0.75),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: const JumpingDotEffect(
                        jumpScale: 2,
                        verticalOffset: 8,
                        // offset: 15,
                        activeDotColor: kMainColor,
                        dotColor: kGrey,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: !isLastPage
                          ? GestureDetector(
                              onTap: () {
                                _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: CustomBtn(
                                btnColor: kMainColor,
                                btnText: isLastPage ? "Get Started" : "Next",
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: CustomBtn(
                                btnColor: kMainColor,
                                btnText: isLastPage ? "Get Started" : "Next",
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

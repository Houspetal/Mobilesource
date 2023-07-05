import 'package:flutter/material.dart';
import 'package:grade_project/house_petal/view/control/control.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helper/cache/cache.dart';
import '../../shared/constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/utils.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  PageController controller = PageController(initialPage: 0);
  List<Map<String, String>> pages = [
    {
      "image": "assets/414.jpg",
      "title": "Schedule with doctors at home",
      "description": "You Can Schedule with doctors at home without any effort"
    },
    {
      "image": "assets/19834.jpg",
      "title": "Special Doctors",
      "description": "Our doctors have experience more than 5 years"
    },
    {
      "image": "assets/covid.jpg",
      "title": "Read important advices",
      "description": "Read a lot of valiable advices that help you to be safe"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Container(
            // onboardingMVd (26:563)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // imagesQ6X (26:604)
                  width: double.infinity,
                  child: SizedBox(
                    height: fem * 480,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: pages.length,
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              // rectangle18cbu (26:598)
                              width: 288 * fem,
                              height: 300 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * fem),
                                color: const Color(0xffc4c4c4),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    pages[index]["image"]!,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupsws7SMy (BjqCGmUSmyC6VpbU1sSWS7)
                              padding: EdgeInsets.fromLTRB(
                                  20 * fem, 40 * fem, 19 * fem, 8 * fem),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // firsttoknowYjm (26:599)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 24 * fem),
                                    child: Text(
                                      pages[index]["title"]!,
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 24 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3333333333 * ffem / fem,
                                        color: const Color(0xff333647),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 217 * fem,
                                    ),
                                    child: Text(
                                      pages[index]["description"]!,
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                        color: const Color(0xff7c81a1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  onDotClicked: (index) {
                    controller.animateToPage(
                      index,
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                    );
                    setState(() {
                      currentPage = index;
                    });
                  },
                  axisDirection: Axis.horizontal,
                  effect: const WormEffect(
                    spacing: 8.0,
                    type: WormType.thin,
                    radius: 4.0,
                    dotWidth: 40.0,
                    dotHeight: 14.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 50 * fem, 20 * fem, 0 * fem),
                  child: CustomButton(
                    color: primaryColor,
                    text: currentPage != 2 ? "Next" : "Get Started",
                    ffem: ffem,
                    fem: fem,
                    width: double.infinity,
                    onPressed: () {
                      if (currentPage != 2) {
                        controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceInOut,
                        );
                        setState(() {
                          currentPage = ++currentPage;
                        });
                        print(currentPage);
                      } else {
                        CacheHelper.setData(
                          key: "onBoarding",
                          value: true,
                        ).then(
                          (value) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ControlScreen(),
                              ),
                              (route) => false,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

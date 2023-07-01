import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // splashscreen9sq (1:65)
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff475ad6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupqad1WkK (BjqD95MxB8nQsBYXcWqaD1)
                padding: EdgeInsets.fromLTRB(
                    121 * fem, 314 * fem, 120 * fem, 8 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // logounT (2:245)
                      margin: EdgeInsets.fromLTRB(
                          6 * fem, 0 * fem, 8 * fem, 345 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // logoiconnLT (2:248)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 24 * fem),
                            width: 48 * fem,
                            height: 48 * fem,
                            child: Image.asset(
                              'assets/news-app/images/logo-icon.png',
                              width: 48 * fem,
                              height: 48 * fem,
                            ),
                          ),
                          SizedBox(
                            // logotext1j1 (2:246)
                            width: 120 * fem,
                            height: 24 * fem,
                            child: Image.asset(
                              'assets/news-app/images/logo-text-S83.png',
                              width: 120 * fem,
                              height: 24 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

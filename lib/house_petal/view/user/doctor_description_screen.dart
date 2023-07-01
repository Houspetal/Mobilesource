import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class DoctorDescriptionScreen extends StatelessWidget {
  const DoctorDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // articlepage3CMq (26:44)
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(16 * fem),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20 * fem, 30 * fem, 19 * fem, 0 * fem),
            width: 375 * fem,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // imagekNf (26:45)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
                  width: double.infinity,
                  height: 192 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16 * fem),
                    color: const Color(0x2822242f),
                    gradient: const LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: <Color>[Color(0x0022242f), Color(0x7a22242f)],
                      stops: <double>[0, 1],
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/news-app/images/image-bg-km1.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  // label7W3 (26:55)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                  width: 100 * fem,
                  height: 32 * fem,
                  decoration: BoxDecoration(
                    color: const Color(0xff475ad6),
                    borderRadius: BorderRadius.circular(16 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'US Election',
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3333333333 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Container(
                  // thelatestsituationinthepreside (26:54)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 335 * fem,
                  ),
                  child: Text(
                    'The latest situation in the presidential election',
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.4 * ffem / fem,
                      color: const Color(0xff333647),
                    ),
                  ),
                ),
                Container(
                  // writer45q (26:50)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 207 * fem, 32 * fem),
                  width: double.infinity,
                  height: 48 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ellipse5u6T (26:51)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 16 * fem, 0 * fem),
                        width: 48 * fem,
                        height: 48 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24 * fem),
                          color: const Color(0xffc4c4c4),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/news-app/images/ellipse-5-bg.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        // autogroupjuyduEs (BjpNv3YqmP9ZRH5qVdJuyd)
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // johndoenZZ (26:52)
                              'John Doe',
                              style: SafeGoogleFont(
                                'SF Pro Text',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xff333647),
                              ),
                            ),
                            Text(
                              // designerP3Z (26:53)
                              'Designer',
                              style: SafeGoogleFont(
                                'SF Pro Text',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.7142857143 * ffem / fem,
                                color: const Color(0xff7c81a1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // contentbfR (26:47)
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // resultsJ43 (26:49)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 8 * fem),
                        child: Text(
                          'Results',
                          style: SafeGoogleFont(
                            'SF Pro Text',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff333647),
                          ),
                        ),
                      ),
                      Container(
                        // leadsinindividualstatesmaychan (26:48)
                        constraints: BoxConstraints(
                          maxWidth: 335 * fem,
                        ),
                        child: Text(
                          "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\n For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters. Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\n For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.",
                          style: SafeGoogleFont(
                            'SF Pro Text',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff666c8e),
                          ),
                        ),
                      ),
                    ],
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

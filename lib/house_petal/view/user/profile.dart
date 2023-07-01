import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../widgets/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20 * fem, 50 * fem, 19 * fem, 40 * fem),
          width: 375 * fem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // titlev4K (26:128)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 121 * fem, 32 * fem),
                width: 215 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // profile9By (26:126)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 32 * fem),
                      child: Text(
                        'Profile',
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.3333333333 * ffem / fem,
                          color: const Color(0xff333647),
                        ),
                      ),
                    ),
                    SizedBox(
                      // autogroupsdibQtb (BjpL9dA9DaEng8UTTfSDiB)
                      width: double.infinity,
                      height: 72 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse5LXM (26:129)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 24 * fem, 0 * fem),
                            width: 72 * fem,
                            height: 72 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36 * fem),
                              color: const Color(0xffc4c4c4),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/news-app/images/ellipse-5-bg-rQ3.png',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupgyefQGK (BjpLHCmr3LDufhVeUBGYEf)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 12 * fem, 0 * fem, 12 * fem),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // erenturkmen7Rd (26:130)
                                  'Eren Turkmen',
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff333647),
                                  ),
                                ),
                                Text(
                                  // ertukengmailcomAPu (26:131)
                                  'ertuken@gmail.com',
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
                  ],
                ),
              ),
              Container(
                // notificationsHDd (26:137)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                padding:
                    EdgeInsets.fromLTRB(24 * fem, 16 * fem, 16 * fem, 16 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f3f6),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // notificationsrR9 (26:133)
                      child: Text(
                        'Notifications',
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff666c8e),
                        ),
                      ),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: primaryColor,
                    ),
                  ],
                ),
              ),
              Container(
                // languagedqD (26:146)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                padding: EdgeInsets.fromLTRB(
                    24 * fem, 16 * fem, 24.87 * fem, 16 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f3f6),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff666c8e),
                      ),
                    ),
                    Container(
                      // angleright51y1u (26:149)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 0.01 * fem),
                      width: 6.25 * fem,
                      height: 10.49 * fem,
                      child: Image.asset(
                        'assets/news-app/images/angle-right-5-1.png',
                        width: 6.25 * fem,
                        height: 10.49 * fem,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // changepasswordb3H (26:138)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 32 * fem),
                padding: EdgeInsets.fromLTRB(
                    24 * fem, 16 * fem, 24.87 * fem, 16 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f3f6),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Password',
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff666c8e),
                      ),
                    ),
                    Container(
                      // angleright51Lf5 (26:144)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 0.01 * fem),
                      width: 6.25 * fem,
                      height: 10.49 * fem,
                      child: Image.asset(
                        'assets/news-app/images/angle-right-5-1-HLf.png',
                        width: 6.25 * fem,
                        height: 10.49 * fem,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // privacyE4j (26:156)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                padding: EdgeInsets.fromLTRB(
                    24 * fem, 16 * fem, 24.87 * fem, 16 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f3f6),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy',
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff666c8e),
                      ),
                    ),
                    Container(
                      // angleright51WyH (26:159)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 0.01 * fem),
                      width: 6.25 * fem,
                      height: 10.49 * fem,
                      child: Image.asset(
                        'assets/news-app/images/angle-right-5-1-vJf.png',
                        width: 6.25 * fem,
                        height: 10.49 * fem,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // termsconditionsKQw (26:161)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 32 * fem),
                padding: EdgeInsets.fromLTRB(
                    24 * fem, 16 * fem, 24.87 * fem, 16 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f3f6),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terms & Conditions',
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff666c8e),
                      ),
                    ),
                    Container(
                      // angleright511Kh (26:164)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 0.01 * fem),
                      width: 6.25 * fem,
                      height: 10.49 * fem,
                      child: Image.asset(
                        'assets/news-app/images/angle-right-5-1-NgB.png',
                        width: 6.25 * fem,
                        height: 10.49 * fem,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // signoutReK (26:186)
                padding:
                    EdgeInsets.fromLTRB(24 * fem, 16 * fem, 20 * fem, 16 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xfff3f3f6),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign Out',
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff666c8e),
                      ),
                    ),
                    SizedBox(
                      // signout1ENo (26:191)
                      width: 16 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/news-app/images/signout-1.png',
                        width: 16 * fem,
                        height: 20 * fem,
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

import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class EmptyBookmarks extends StatelessWidget {
  const EmptyBookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // bookmarksemptystate2fM (14:292)
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(16 * fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                // bookmarksngT (14:307)
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                child: Text(
                  'Bookmarks',
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
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 166 * fem),
                child: Text(
                  'Saved doctors to the library\n',
                  style: SafeGoogleFont(
                    'SF Pro Text',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * ffem / fem,
                    color: const Color(0xff7c81a1),
                  ),
                ),
              ),
              SizedBox(
                // group12D31 (14:355)
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // autogroupnt4bfQo (BjpRZdob3ZcMWaBTpyNt4B)
                      backgroundColor: const Color(0xffeef0fb),
                      radius: ffem * 35,
                      child: Center(
                        // bookalt11Mwq (14:345)
                        child: SizedBox(
                          width: 16 * fem,
                          height: 20 * fem,
                          child: Image.asset(
                            'assets/news-app/images/book-alt-1-1.png',
                            width: 16 * fem,
                            height: 20 * fem,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      // youhaventsavedanyarticlesyetst (14:348)
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 250 * fem,
                        ),
                        child: Text(
                          'You haven\'t saved any Appointments yet. Start Booking and bookmarking them now\n',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'SF Pro Text',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff333647),
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
      ),
    );
  }
}

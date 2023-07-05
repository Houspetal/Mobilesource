import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import 'package:grade_project/house_petal/shared/constants/colors.dart';
import 'package:grade_project/house_petal/view/doctor/doctor_view/doctor_veiw.dart';
import "package:grade_project/house_petal/view/user/user_auth/sign_in.dart";

import "../../helper/cache/cache.dart";
import "../admin/admin_view/admin_veiw.dart";

class ControlScreen extends StatelessWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/banner3.jpg",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor.withOpacity(.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/user.svg",
                        semanticsLabel: 'Acme Logo',
                        width: 110,
                        height: 110,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                const MaterialStatePropertyAll<Color>(
                              Colors.black87,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            overlayColor: MaterialStatePropertyAll<Color>(
                              primaryColor.withOpacity(.1),
                            ),
                            textStyle:
                                const MaterialStatePropertyAll<TextStyle>(
                              TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(color: textColor, blurRadius: 40)
                                ],
                              ),
                            ),
                          ),
                          onPressed: () {
                            CacheHelper.setData(
                              key: "appType",
                              value: "user",
                            ).then(
                              (value) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserSignInScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                            );
                          },
                          child: const Text("Login as User")),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor.withOpacity(.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/doctor.svg",
                        semanticsLabel: 'Acme Logo',
                        width: 110,
                        height: 110,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                const MaterialStatePropertyAll<Color>(
                              Colors.black87,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            textStyle:
                                const MaterialStatePropertyAll<TextStyle>(
                              TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(color: textColor, blurRadius: 12)
                                ],
                              ),
                            ),
                            overlayColor: MaterialStatePropertyAll<Color>(
                              primaryColor.withOpacity(.1),
                            ),
                          ),
                          onPressed: () {
                            CacheHelper.setData(
                              key: "appType",
                              value: "doctor",
                            ).then(
                              (value) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DoctorScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                            );
                          },
                          child: const Text("Login as Doctor")),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor.withOpacity(.4),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/admin.svg",
                        semanticsLabel: 'Acme Logo',
                        width: 110,
                        height: 110,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          CacheHelper.setData(
                            key: "appType",
                            value: "admin",
                          ).then(
                            (value) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AdminScreen(),
                                ),
                                (route) => false,
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll<Color>(
                            Colors.black87,
                          ),
                          textStyle: const MaterialStatePropertyAll<TextStyle>(
                            TextStyle(
                              fontSize: 18,
                              shadows: [
                                Shadow(color: textColor, blurRadius: 40)
                              ],
                            ),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          overlayColor: MaterialStatePropertyAll<Color>(
                            primaryColor.withOpacity(.1),
                          ),
                        ),
                        child: const Text("Login as Admin"),
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

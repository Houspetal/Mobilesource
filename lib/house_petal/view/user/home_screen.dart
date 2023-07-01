import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 75,
              ),
              SizedBox(
                height: 175,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: primaryColor.withOpacity(.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/news-app/images/apps-1-1.png",
                                height: 50,
                                width: 40,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const CustomText(
                                text: "Clinic Visit",
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const CustomText(
                                text: "Make an appointment",
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/news-app/images/apps-1-1.png",
                                height: 50,
                                width: 40,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const CustomText(
                                text: "Home Visit",
                                size: 16,
                                color: Colors.black87,
                                weight: FontWeight.w500,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const CustomText(
                                text: "Call the doctor at home",
                                color: Colors.black26,
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: "What are Your Symptoms?",
                size: 24,
                weight: FontWeight.w500,
                color: textColor2,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: textColor2.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: CustomText(
                        text: "🤒 Temperature",
                        align: Alignment.center,
                        color: Colors.black87,
                        size: 16,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: 10,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomText(
                text: "Popular Doctors",
                size: 24,
                weight: FontWeight.w500,
                color: textColor2,
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: 3,
                childAspectRatio: 5 / 7,
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  5,
                  (index) => _buildGridItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem() {
    return Container(
      height: 200,
      color: Colors.white,
      child: Card(
        elevation: 20,
        shadowColor: textColor.withOpacity(.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor.withOpacity(.7),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Doctor Dave",
              size: 16,
              color: Colors.black87,
              weight: FontWeight.w500,
              align: Alignment.center,
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomText(
              text: "Doctor Dave",
              size: 14,
              align: Alignment.center,
              color: Colors.black26,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 66,
              height: 35,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                  CustomText(
                    text: "5.0",
                    size: 16,
                    color: Colors.black87,
                    weight: FontWeight.w700,
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

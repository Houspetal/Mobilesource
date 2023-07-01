import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: textColor2.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .31,
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: const CustomText(
                          text: "Upcoming",
                          size: 14,
                          align: Alignment.center,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .31,
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: const CustomText(
                          text: "Completed",
                          size: 14,
                          align: Alignment.center,
                          color: textColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .31,
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: const CustomText(
                          text: "Canceled",
                          size: 14,
                          align: Alignment.center,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomText(
                text: "Nearest Visit",
                size: 20,
                color: textColor,
                weight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      color: textColor2.withOpacity(.13),
                      blurRadius: 5,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Doctor Dava",
                                size: 18,
                                weight: FontWeight.w500,
                                color: textColor2,
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                text: "Cardiologist",
                                size: 14,
                                color: textColor2.withOpacity(.7),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 30,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.black26, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: textColor2,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "6/30/2023",
                                size: 14,
                                color: textColor2,
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.access_time_filled,
                                color: textColor2,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "10:00 PM",
                                size: 14,
                                color: textColor2,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green.withOpacity(.7),
                              ),
                              const SizedBox(width: 5),
                              const CustomText(
                                text: "10:00 PM",
                                size: 14,
                                color: textColor2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          color: textColor2.withOpacity(.2),
                          text: "Re-schedule",
                          textColor: textColor2,
                          width: MediaQuery.of(context).size.width * .4,
                          ffem: .8,
                          fem: .8,
                        ),
                        CustomButton(
                          color: primaryColor,
                          text: "Cancel",
                          ffem: .8,
                          width: MediaQuery.of(context).size.width * .4,
                          fem: .8,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomText(
                text: "Future Visit",
                size: 20,
                color: textColor,
                weight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      color: textColor2.withOpacity(.13),
                      blurRadius: 5,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Doctor Dava",
                                size: 18,
                                weight: FontWeight.w500,
                                color: textColor2,
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                text: "Cardiologist",
                                size: 14,
                                color: textColor2.withOpacity(.7),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 30,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.black26, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: textColor2,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "6/30/2023",
                                size: 14,
                                color: textColor2,
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.access_time_filled,
                                color: textColor2,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "10:00 PM",
                                size: 14,
                                color: textColor2,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green.withOpacity(.7),
                              ),
                              const SizedBox(width: 5),
                              const CustomText(
                                text: "10:00 PM",
                                size: 14,
                                color: textColor2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          color: textColor2.withOpacity(.2),
                          text: "Re-schedule",
                          textColor: textColor2,
                          width: MediaQuery.of(context).size.width * .4,
                          ffem: .8,
                          fem: .8,
                        ),
                        CustomButton(
                          color: primaryColor,
                          text: "Cancel",
                          ffem: .8,
                          width: MediaQuery.of(context).size.width * .4,
                          fem: .8,
                        ),
                      ],
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

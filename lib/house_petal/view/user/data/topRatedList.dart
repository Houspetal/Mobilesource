import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../widgets/custom_text.dart';
import '../user_views/doctorProfile.dart';

class TopRatedList extends StatefulWidget {
  const TopRatedList({super.key});

  @override
  _TopRatedListState createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        mainAxisSpacing: 3,
        childAspectRatio: 5 / 7,
        physics: const BouncingScrollPhysics(),
        children: List.generate(
          5,
          (index) => _buildGridItem(
            image:
                "https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg",
            name: 'Doctor Dave',
            description: 'mr dave',
            rating: '5',
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(
      {required String name,
      required String description,
      required String image,
      required String rating}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorProfile(
              doctor: "doctor['name']",
            ),
          ),
        );
      },
      child: Container(
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
                backgroundImage: NetworkImage(image),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: "Doctor $name",
                size: 16,
                color: Colors.black87,
                weight: FontWeight.w500,
                align: Alignment.center,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: description,
                size: 14,
                align: Alignment.center,
                color: Colors.black26,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                height: 35,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    CustomText(
                      text: "$rating Stars",
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
      ),
    );
  }
}

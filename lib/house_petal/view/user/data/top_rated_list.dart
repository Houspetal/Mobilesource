import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/house_petal/logic/user_home/user_home_cubit.dart';

import '../../../model/doctor_model.dart';
import '../../../shared/constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../user_views/doctor_profile.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserHomeCubit, UserHomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 3,
            childAspectRatio: 4 / 7,
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              UserHomeCubit.of(context).doctors.length,
              (index) => _buildGridItem(
                doctor: UserHomeCubit.of(context).doctors[index],
                context: context,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridItem({
    required DoctorModel doctor,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorProfile(
              doctor: doctor,
            ),
          ),
        );
      },
      child: Container(
        height: 300,
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
                backgroundImage: CachedNetworkImageProvider(
                  doctor.image!,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: "Doctor ${doctor.name}",
                size: 14,
                color: Colors.black87,
                weight: FontWeight.w500,
                align: Alignment.center,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: "${doctor.department}",
                size: 14,
                align: Alignment.center,
                color: Colors.black26,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                height: 45,
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
                      text: "${doctor.rating} Stars",
                      size: 16,
                      color: Colors.black87,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 5,
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

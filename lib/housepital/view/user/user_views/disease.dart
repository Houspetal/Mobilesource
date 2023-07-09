import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/logic/user_logic/user_disease/user_disease_cubit.dart';

import 'disease_detail.dart';

class Disease extends StatelessWidget {
  const Disease({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Disease',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: BlocConsumer<UserDiseaseCubit, UserDiseaseStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black87,
                    width: 0.2,
                  ))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiseaseDetail(
                            disease:
                                UserDiseaseCubit.of(context).diseases[index],
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${UserDiseaseCubit.of(context).diseases[index].name}",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "${UserDiseaseCubit.of(context).diseases[index].name} disease",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              itemCount: UserDiseaseCubit.of(context).diseases.length,
            );
          },
        ));
  }
}

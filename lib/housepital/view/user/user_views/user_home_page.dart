import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/logic/user_logic/user_home/user_home_cubit.dart';
import 'package:grade_project/housepital/model/doctor_model.dart';
import 'package:grade_project/housepital/shared/constants/constants.dart';
import 'package:intl/intl.dart';

import '../../../model/cardModel.dart';
import '../../../shared/constants/colors.dart';
import '../data/search_list.dart';
import '../data/top_rated_list.dart';
import 'carousel_slider.dart';
import 'explore_list.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _doctorName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _doctorName = TextEditingController();
  }

  @override
  void dispose() {
    _doctorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String message = "";
    DateTime now = DateTime.now();
    String currentHour = DateFormat('kk').format(now);
    int hour = int.parse(currentHour);

    setState(
      () {
        if (hour >= 5 && hour < 12) {
          message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          message = 'Good Afternoon';
        } else {
          message = 'Good Evening';
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          //width: MediaQuery.of(context).size.width/1.3,
          alignment: Alignment.center,
          child: Text(
            message,
            style: GoogleFonts.lato(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<UserHomeCubit, UserHomeStates>(
        listener: (context, state) {},
        builder: (context, state) => user == null ||
                UserHomeCubit.of(context).doctors.isEmpty ||
                uid == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : SafeArea(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            "Hello ${user!.username}",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20, bottom: 25),
                          child: Text(
                            "Let's Find Your\nDoctor",
                            style: GoogleFonts.lato(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                          child: TextFormField(
                            textInputAction: TextInputAction.search,
                            controller: _doctorName,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Search doctor',
                              hintStyle: GoogleFonts.lato(
                                color: Colors.black26,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[900]!.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  iconSize: 20,
                                  splashRadius: 20,
                                  color: Colors.white,
                                  icon:
                                      const Icon(FontAwesomeIcons.searchengin),
                                  onPressed: () {
                                    setState(
                                      () {
                                        List<DoctorModel> search =
                                            UserHomeCubit.of(context)
                                                .doctorSearch(
                                          name: _doctorName.text,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchList(
                                              doctors: search,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                            onFieldSubmitted: (String value) {
                              setState(
                                () {
                                  List<DoctorModel> search =
                                      UserHomeCubit.of(context).doctorSearch(
                                    name: value,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchList(
                                        doctors: search,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 23, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "We care for you",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const CarouselSliderBuilder(),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Specialists",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 150,
                          padding: const EdgeInsets.only(top: 14),
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            itemCount: cards.length,
                            itemBuilder: (context, index) {
                              //print("images path: ${cards[index].cardImage.toString()}");
                              return Container(
                                margin: const EdgeInsets.only(right: 14),
                                height: 150,
                                width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(cards[index].cardBackground),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[400]!,
                                        blurRadius: 4.0,
                                        spreadRadius: 0.0,
                                        offset: const Offset(3, 3),
                                      ),
                                    ]
                                    // image: DecorationImage(
                                    //   image: AssetImage(cards[index].cardImage),
                                    //   fit: BoxFit.fill,
                                    // ),
                                    ),
                                // ignore: deprecated_member_use
                                child: MaterialButton(
                                  onPressed: () {
                                    List<DoctorModel> doctors =
                                        UserHomeCubit.of(context)
                                            .departmentSearch(
                                      department: cards[index].doctor,
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserExploreList(
                                          type: cards[index].doctor,
                                          doctors: doctors,
                                        ),
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 29,
                                          child: Icon(
                                            cards[index].cardIcon,
                                            size: 26,
                                            color: Color(
                                                cards[index].cardBackground),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          cards[index].doctor,
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Top Rated",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: const TopRatedList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/house_petal/view/widgets/custom_text.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Title Drawer")),
      body: Container(),
      drawer: NavigationDrawer(
        backgroundColor: const Color(0xFF071251),
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Image.asset(
                    "assets/414.jpg",
                    width: 200,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                _buildDrawerItem(
                  title: "Dashboard",
                  icon: FontAwesomeIcons.houseMedical,
                  onTap: () {},
                ),
                _buildDropDown(
                  title: "Appointments",
                  icon: FontAwesomeIcons.handshake,
                  items: <Widget>[
                    _buildDrawerItem(
                      title: "Make Appointments",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      title: "New Appointments",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      title: "Done Appointments",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      title: "Trashed Appointments",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                  ],
                ),
                _buildDrawerItem(
                  title: "Schedules",
                  icon: FontAwesomeIcons.calendarPlus,
                  onTap: () {},
                ),
                _buildDropDown(
                  title: "My info",
                  icon: FontAwesomeIcons.circleInfo,
                  items: <Widget>[
                    _buildDrawerItem(
                      title: "Profile",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      title: "About",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      title: "Specialty",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      title: "Education",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      title: "Experiences",
                      icon: FontAwesomeIcons.circleDot,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.solidHospital,
                      color: Color(0xFF4624BB),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      "HOUSEPETAL",
                      style: GoogleFonts.sanchez(color: const Color(0xFF4624BB)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      {required String title,
      required IconData icon,
      required GestureTapCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.normal),
      ),
      leading: FaIcon(icon, size: 20),
      textColor: Colors.white54,
      hoverColor: Colors.white54,
      iconColor: Colors.white54,
      selectedColor: Colors.white54,
    );
  }

  Widget _buildDropDown({
    required String title,
    required IconData icon,
    required List<Widget> items,
  }) {
    return ExpansionTile(
      title: CustomText(
        text: title,
        size: 14,
        color: Colors.white54,
      ),
      iconColor: Colors.white54,
      collapsedIconColor: Colors.white54,
      leading: FaIcon(
        icon,
        color: Colors.white54,
        size: 20,
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      children: items,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grade_project/house_petal/logic/user_auth/user_auth_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(
        Uri.parse('https://drapp.website/doctor'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
            iconSize: 20,
            color: Colors.white54,
            onPressed: () {
              UserAuthCubit.of(context).signOut(context);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: const Color(0xFF071251),
        toolbarHeight: 40,
        title: const Text(
          "Doctor",
          style: TextStyle(color: Colors.white54),
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

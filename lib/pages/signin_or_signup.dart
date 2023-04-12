// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:medical_consultation_app/constants/custom_text.dart';
import 'package:medical_consultation_app/pages/signin.dart';
import 'package:medical_consultation_app/pages/signup.dart';
import 'package:permission_handler/permission_handler.dart';

class SignInOrSignUp extends StatefulWidget {
  const SignInOrSignUp({super.key});

  @override
  State<SignInOrSignUp> createState() => _SignInOrSignUpState();
}

class _SignInOrSignUpState extends State<SignInOrSignUp> {
  void permissionSeek() async {
    var status = await Permission.sms.request();
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }

    // You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }

  @override
  void initState() {
    permissionSeek();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 1,
          shadowColor: Colors.grey,
          leading: GestureDetector(
            onTap: (){
              // Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(13),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.green.shade600,
                  width: 2,
                ),
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomText(
                    text: "SignUp",
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "SignIn",
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SignUpCHEMO(
              screenSize: screenSize,
            ),
            SignInCHEMO(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}
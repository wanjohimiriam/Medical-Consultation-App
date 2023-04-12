// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_consultation_app/constants/custom_auth_buttons.dart';
import 'package:medical_consultation_app/constants/custom_text.dart';
import 'package:medical_consultation_app/constants/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";

class SignUpCHEMO extends StatefulWidget {
  final Size screenSize;
  void Function()? onPressed;
  SignUpCHEMO({super.key, required this.screenSize, this.onPressed});

  @override
  State<SignUpCHEMO> createState() => _SignUpCHEMOState();
}

class _SignUpCHEMOState extends State<SignUpCHEMO> {
  void registerUser(String fnane, String lname, String email, String phone, String pword) async {
    print("one...");
    showDialog(
      context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      )
    );
    print("two...");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      "register", 
      [
        fnane,
        lname,
        email,
        phone,
        pword,
      ],
    );
    print("three...");

    Navigator.pushReplacementNamed(context, "/home");

    var response = await http.post(
      Uri.parse("https://api.africastalking.com/version1/messaging"),
      headers: {
        "Accept": "application/json",
        "apikey": "08fc7d8cae8157c54a1f3d4c152969b3c499f334c88e3d01f668d094feb4aa64",
        "Content-Type" : "application/x-www-form-urlencoded",
      },
      body: {
        "to": phone,
        "username": "mirrow_dev",
        "message": "You have successfully registered to our chemotherapy programme. We start our meet-ups at 1800 a.m",
      },
    );
    print("four...");

    if(response.statusCode == 201){
      print("five...");
      Fluttertoast.showToast(msg: "Register Success!!", toastLength: Toast.LENGTH_LONG);
      Navigator.pop(context);
    } else {
      print("Six...");
      print("Status code: ${response.statusCode}");
      Fluttertoast.showToast(msg: "Error occurred during registration. Status code: ${response.statusCode}", toastLength: Toast.LENGTH_LONG);
    }
  }
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController pword = TextEditingController();
  final TextEditingController cPword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: widget.screenSize.height * 0.05),
                CustomText(
                  text: "Register Account",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                Container(width: widget.screenSize.width * 0.8, height: 1, color: Colors.black),
                SizedBox(height: widget.screenSize.height * 0.02),
                CustomText(
                  text: "Setup a new account in a minute.",
                  fontSize: 16,
                  color: Colors.black,
                ),
                SizedBox(height: widget.screenSize.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: widget.screenSize.width * 0.4,
                      child: CustomTextFormField(
                        controller: fname,
                        validator: (val){
                          return val!.isEmpty ? "Input field required" : null;
                        },
                        hintText: "First name*",
                      ),
                    ),
                    Container(
                      width: widget.screenSize.width * 0.4,
                      child: CustomTextFormField(
                        controller: lname,
                        validator: (val){
                          return val!.isEmpty ? "Input field required" : null;
                        },
                        hintText: "Last name*",
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  controller: email, 
                  validator: (val){
                    return val!.isEmpty ? "Email field required" : null;
                  },
                  hintText: "Email*"
                ),
                CustomTextFormField(
                  controller: phone, 
                  validator: (val){
                    return val!.isEmpty ? "Phone number is required" : null;
                  },
                  hintText: "Phone number"
                ),
                CustomTextFormField(
                  controller: pword, 
                  validator: (val){
                    return val!.isEmpty ? "Password cannot be blank" : null;
                  },
                  hintText: "Password"
                ),
                CustomTextFormField(
                  controller: cPword, 
                  validator: (val){
                    return val! != pword.text ? "Passwords do not match" : null;
                  },
                  hintText: "Confirm pasword"
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        child: Checkbox(
                          value: check, 
                          onChanged: (val){
                            setState(() {
                              check = !check;
                            });
                          }
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        text: "I agree to all the ",
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      CustomText(
                        text: "terms & conditions ",
                        fontSize: 16,
                        color: Colors.blue[600],
                      ),
                      CustomText(
                        text: "of ONIX",
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                CustomAuthButton(
                  text: "Create a new account",
                  icon: Icons.person_add,
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      registerUser(fname.text, lname.text, email.text, phone.text, pword.text);
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height * 0.03,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: widget.screenSize.height * 0.05)
              ],
            ),
          ),
        ),
      )
    );
  }
}
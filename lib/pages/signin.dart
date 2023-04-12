import "package:flutter/material.dart";
import 'package:medical_consultation_app/constants/custom_auth_buttons.dart';
import 'package:medical_consultation_app/constants/custom_text_form_field.dart';

import '../constants/custom_text.dart';

class SignInCHEMO extends StatefulWidget {
  final Size screenSize;
  void Function()? onPressed;

  SignInCHEMO({super.key, required this.screenSize, this.onPressed});

  @override
  State<SignInCHEMO> createState() => _SignInCHEMOState();
}

class _SignInCHEMOState extends State<SignInCHEMO> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pword = TextEditingController();

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
                  text: "Welcome Back!!!",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                Container(width: widget.screenSize.width * 0.8, height: 1, color: Colors.black),
                SizedBox(height: widget.screenSize.height * 0.02),
                CustomText(
                  text: "Use credentials to access your account.",
                  fontSize: 16,
                  color: Colors.black,
                ),
                SizedBox(height: widget.screenSize.height * 0.03),
                CustomTextFormField(
                  controller: email, 
                  validator: (val){
                    return val!.isEmpty ? "Input field cannot be blank" : null;
                  },
                  hintText: "Enter your Email"
                ),
                CustomTextFormField(
                  controller: pword, 
                  validator: (val){
                    return val!.isEmpty ? "Password required" : null;
                  },
                  hintText: "Password"
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Colors.transparent,
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
                            text: "Remember me.",
                            fontSize: 15,
                            color: Colors.grey[900],
                          ),
                        ],
                      ),
                      CustomText(
                        text: "Forgot Password?",
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                CustomAuthButton(
                  text: "Log into your account",
                  icon: Icons.lock_open,
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      widget.onPressed;
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
                          text: "Dont have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: "Sign Up",
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
              ],
            ),
          ),
        ),
      )
    );
  }
}
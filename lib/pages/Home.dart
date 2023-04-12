// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medical_consultation_app/constants/custom_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 65,
        backgroundColor: Colors.teal,
        centerTitle: false,
        title: Center(child: Text("Medical Consultation App")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.23, 
                backgroundImage: AssetImage("assets/cca2.png")
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Consultation()
          ],
        ),
      ),
    );
  }
}

class Consultation extends StatefulWidget {
  const Consultation({
    Key? key,
  }) : super(key: key);

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  List data = [];

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List user = prefs.getStringList("register") ?? [];
    setState(() {
      data = user;
    });

    print(data);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Name:',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                data[0] +" "+ data[1],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Email Address:',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                data[2],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black, fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Phone No:',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                data[3],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black, fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text("Therapy Treatment "),
            subtitle: Text("12/3/2021"),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 17,
            ),
          ),
          ListTile(
            title: Text("Chemo next appointment"),
            subtitle: Text("10/6/2020"),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 17,
            ),
          ),
          ListTile(
            title: Text(" Consultation"),
            subtitle: Text("1/10/2020"),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 17,
            ),
          ),
          ListTile(
            title: Text("Appointment"),
            subtitle: Text("05/1/2019"),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 17,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Completed Chemos...",
                  fontSize: 18,
                  color: Colors.grey[900],
                ),
                CircularPercentIndicator(
                  radius: MediaQuery.of(context).size.width * 0.06,
                  percent: 0.25,
                  progressColor: Colors.red.shade700,
                  center: CustomText(
                    text: "25%",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
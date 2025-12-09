import 'dart:ui';
import 'package:bmi/widget/custom_app_bar.dart';
import 'package:bmi/widget/gender_box.dart';
import 'package:flutter/material.dart';
import 'result_screen.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  double height = 150;
  int age = 21;
  int weight = 60;

  String selectedGender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

     body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(height: 25),
      // ----------------- GENDER -----------------
      Row(
        children: [
          Expanded(
            child: GenderBox(
              title: "Male",
              icon: Icons.male,
              isSelected: selectedGender == "Male",
              onTap: () {
                setState(() {
                  selectedGender = "Male";
                });
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GenderBox(
              title: "Female",
              icon: Icons.female,
              isSelected: selectedGender == "Female",
              onTap: () {
                setState(() {
                  selectedGender = "Female";
                });
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 25),
      // ----------------- HEIGHT -----------------
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Color(0xff333244),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text("Height",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: height.toStringAsFixed(0),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " cm",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Slider(
              min: 80,
              max: 220,
              value: height,
              activeColor: Color(0xffE83D67),
              inactiveColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            ),
          ],
        ),
      ),
      SizedBox(height: 25),
      // ----------------- AGE & WEIGHT -----------------
      Row(
        children: [
          // AGE BOX
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff333244),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text("Age",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 10),
                  Text(
                    "$age",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.small(
                        heroTag: "age-",
                        onPressed: () {
                          setState(() {
                            if (age > 1) age--;
                          });
                        },
                        backgroundColor: Color(0xff444355),
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 10),
                      FloatingActionButton.small(
                        heroTag: "age+",
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        backgroundColor: Color(0xff444355),
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          // WEIGHT BOX
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff333244),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text("Weight",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 10),
                  Text(
                    "$weight",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.small(
                        heroTag: "w-",
                        onPressed: () {
                          setState(() {
                            if (weight > 1) weight--;
                          });
                        },
                        backgroundColor: Color(0xff444355),
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 10),
                      FloatingActionButton.small(
                        heroTag: "w+",
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        backgroundColor: Color(0xff444355),
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),


      // ----------------- BOTTOM  -----------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            // لازم يختار الجنس
            if (selectedGender.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please select your gender first")),
              );
              return;
            }

            // حساب BMI
            double bmi = weight / ((height / 100) * (height / 100));

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ResultScreen(
                  bmi: bmi,
                  resultText: bmi < 18.5
                      ? "Underweight"
                      : bmi < 25
                          ? "Normal"
                          : bmi < 30
                              ? "Overweight"
                              : "Obese",
                  description: bmi < 18.5
                      ? "You are under the normal weight range."
                      : bmi < 25
                          ? "You have a normal body weight. Good job!"
                          : bmi < 30
                              ? "You are above the normal weight."
                              : "Your BMI is very high. Please take care.",
                ),
              ),
            );
          },
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffE83D67), Color(0xffFF6B81)],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: Text(
              "Calculate",
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:bmi/widget/custom_app_bar.dart';
import 'package:bmi/widget/gender_box.dart';
import 'package:flutter/material.dart';

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

      body: Column(
        children: [
          SizedBox(height: 25),

          
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

          
          Row(
            children: [
              /// AGE BOX
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)),
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
                                age--;
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

              /// WEIGHT BOX
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 20)),
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
                                weight--;
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

     bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(16.0),
  child: GestureDetector(
    onTap: () {
      onTap: () {
  double bmi = weight / ((height / 100) * (height / 100));

  String result = "";
  String desc = "";

  if (bmi < 18.5) {
    result = "Underweight";
    desc = "You are below the normal weight. Try to eat more.";
  } else if (bmi < 25) {
    result = "Normal";
    desc = "You have a normal body weight. Good job!";
  } else if (bmi < 30) {
    result = "Overweight";
    desc = "You are above the normal weight. Try to exercise more.";
  } else {
    result = "Obese";
    desc = "Your BMI is very high. Please take care.";
  }

      };
    },
      
  
    child: Container(
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffE83D67), Color(0xffFF6B81)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        "Calculate",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    ),
  ),
),

    );
  }
}

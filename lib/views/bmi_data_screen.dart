import 'package:bmiimhar/constants/constant.dart';
import 'package:flutter/material.dart';

import 'bmi_result_screen.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  double calculateBmi() {
    double heightInMeter = height / 100;

    final h = heightInMeter * heightInMeter;
    final bmi = weight / h;

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      appBar: AppBar(
        title: const Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "Pria";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "Pria") ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.male,
                      title: 'Pria',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "Wanita";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "Wanita") ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.female,
                      title: 'Wanita',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: BmiCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TINGGI BADAN",
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$height",
                      style: numberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: labelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 80,
                  max: 200,
                  thumbColor: Colors.red,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white54,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BERAT BADAN",
                        style: labelTextStyle,
                      ),
                      Text(
                        "$weight",
                        style: numberTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              weight += 1;
                              setState(() {});
                            },
                            elevation: 0,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                          const SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: () {
                              weight -= 1;
                              setState(() {});
                            },
                            elevation: 0,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "UMUR",
                        style: labelTextStyle,
                      ),
                      Text(
                        "$age",
                        style: numberTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              age += 1;
                              setState(() {});
                            },
                            elevation: 0,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                          const SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: () {
                              age -= 1;
                              setState(() {});
                            },
                            elevation: 0,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // print(calculateBmi());
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return BmiResultScreen(
                  bmi: calculateBmi(),
                );
              }),
            );
          },
          child: Container(
            height: 80,
            color: const Color(0xffEC3C66),
            child: const Center(
              child: Text(
                "Hitung BMI",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff272A4B),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

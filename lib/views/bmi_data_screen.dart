import 'package:bmiimhar/constants/constant.dart';
import 'package:bmiimhar/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'bmi_result_screen.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: const [
              Expanded(
                child: BmiCard(
                  child: GenderIconText(
                    icon: Icons.male,
                    title: 'Pria',
                  ),
                ),
              ),
              Expanded(
                  child: BmiCard(
                child: GenderIconText(
                  icon: Icons.female,
                  title: 'Wanita',
                ),
              ))
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tinggi Badan",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "182",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: 100,
                    min: 80,
                    max: 200,
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return BmiResultScreen();
              }),
            );
          },
          child: Container(
            height: 60,
            color: Colors.blue,
            child: Center(child: Text("Hitung BMI")),
          ),
        )
      ]),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff272A4B),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(15),
      child: child,
    );
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

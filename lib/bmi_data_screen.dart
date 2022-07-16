import 'package:bmiimhar/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff272A4B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.male,
                          size: 80,
                        ),
                        Text(
                          "Pria",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff8d8e98),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff272A4B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.female,
                          size: 80,
                        ),
                        Text(
                          "Wanita",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff8d8e98),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.yellow,
        )),
        Expanded(
            child: Container(
          color: Colors.green,
        )),
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

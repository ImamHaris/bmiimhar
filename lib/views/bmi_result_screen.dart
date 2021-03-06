import 'package:bmiimhar/constants/constant.dart';
import 'package:bmiimhar/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);

  final double bmi;

  String determineBmiCategory(double bmiValue) {
    String category = "";
    // if (bmiValue < 16.0) {
    //   category = underWeightServe;
    // } else if (bmiValue >= 16.0 && bmiValue < 17) {
    //   category = underWeightModerate;
    // } else if (bmiValue >= 17.0 && bmiValue < 18.5) {
    //   category = underWeightMild;
    // } else if (bmiValue >= 18.0 && bmiValue < 25.0) {
    //   category = normal;
    // } else if (bmiValue >= 25.0 && bmiValue < 30.0) {
    //   category = overWeight;
    // } else if (bmiValue >= 30.0 && bmiValue < 35.0) {
    //   category = obeseI;
    // } else if (bmiValue >= 35.0 && bmiValue < 40.0) {
    //   category = obeseII;
    // } else if (bmiValue >= 40.0) {
    //   category = obeseIII;
    // }
    if (bmiValue < 16.0) {
      category = underWeightServe;
    } else if (bmiValue < 17) {
      category = underWeightModerate;
    } else if (bmiValue < 18.5) {
      category = underWeightMild;
    } else if (bmiValue < 25.0) {
      category = normal;
    } else if (bmiValue < 30.0) {
      category = overWeight;
    } else if (bmiValue < 35.0) {
      category = obeseI;
    } else if (bmiValue < 40.0) {
      category = obeseII;
    } else if (bmiValue >= 40.0) {
      category = obeseIII;
    }

    return category;
  }

  String getHealthRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underWeightServe:
      case underWeightModerate:
      case underWeightMild:
        desc = "Kemungkinan kekurangan nutrisi dan osteoporosis.";
        break;
      case normal:
        desc = "Risiko rendah (kisaran sehat).";
        break;
      case overWeight:
        desc =
            "Risiko sedang terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "Risiko tinggi terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes mellitus.";
        break;
      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    final bmiDesc = getHealthRiskDescription(bmiCategory);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Hasil Hitung BMI"),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Hasil Perhitungan",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCategory,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmiDesc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: const Color(0xffEC3C66),
              child: const Center(
                child: Text(
                  "Hitung Ulang BMI",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

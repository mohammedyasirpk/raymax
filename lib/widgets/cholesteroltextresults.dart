import 'package:byon_care/widgets/bloodtestresults.dart';
import 'package:flutter/material.dart';
import 'package:byon_care/constents.dart';

class Cholesteroltextresults extends StatelessWidget {
  const Cholesteroltextresults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(5),
        height: 409,
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20.0,
                ),
                const Text(
                  'Test Results',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 25.0,
                      fontFamily: kfontRubikMedium),
                ),
                const Spacer(),
                Image.asset(
                  'images/blood_sugar_hart.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Cholesterol',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 14,
                      fontFamily: kfontRubikMedium),
                ),
                Spacer(),
                Text(
                  '180',
                  style: TextStyle(
                      fontSize: 25,
                      color: kbyoncolor6,
                      fontFamily: kfontRobotoBold),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'mg/dL',
                  style: TextStyle(
                      color: kbyoncolor7,
                      fontSize: 10,
                      fontFamily: kfontPoppinsMedium),
                ),
                Spacer(),
                Text(
                  'Normal',
                  style: TextStyle(
                      color: Color(0XFF00C89C),
                      fontSize: 13,
                      fontFamily: kfontRubikMedium),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Doteline(),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Triglycerides',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 14,
                      fontFamily: kfontRubikMedium),
                ),
                Spacer(),
                Text(
                  '189',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 25,
                      fontFamily: kfontRobotoBold),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'mg/dL',
                  style: TextStyle(
                      color: kbyoncolor7,
                      fontSize: 10,
                      fontFamily: kfontPoppinsMedium),
                ),
                Spacer(),
                Text(
                  'Borderline Risk',
                  style: TextStyle(
                      color: kbyoncolor8,
                      fontSize: 13,
                      fontFamily: kfontRubikMedium),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Doteline(),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'HDL',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 14,
                      fontFamily: kfontRubikMedium),
                ),
                Spacer(),
                Text(
                  '30',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 25,
                      fontFamily: kfontRobotoBold),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'mg/dL',
                  style: TextStyle(
                      color: kbyoncolor7,
                      fontSize: 10,
                      fontFamily: kfontPoppinsMedium),
                ),
                Spacer(),
                Text(
                  'High Risk',
                  style: TextStyle(
                      color: kbyoncolor8,
                      fontSize: 13,
                      fontFamily: kfontRubikMedium),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Doteline(),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'LDL',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 14,
                      fontFamily: kfontRubikMedium),
                ),
                Spacer(),
                Text(
                  '191',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 25,
                      fontFamily: kfontRobotoBold),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'mg/dL',
                  style: TextStyle(
                      color: kbyoncolor7,
                      fontSize: 10,
                      fontFamily: kfontPoppinsMedium),
                ),
                Spacer(),
                Text(
                  'Very High Risk',
                  style: TextStyle(
                      color: kbyoncolor8,
                      fontSize: 13,
                      fontFamily: kfontRubikMedium),
                ),
                SizedBox(
                  width: 20.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

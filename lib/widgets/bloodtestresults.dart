import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';

class Bloodtestresults extends StatelessWidget {
  const Bloodtestresults({Key? key}) : super(key: key);

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
        height: 320.0,
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
                  'Products Details',
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
                  'Fasting Blood Sugar',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 14,
                      fontFamily: kfontRubikMedium),
                ),
                Spacer(),
                Text(
                  '71',
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
                  'Random Blood Sugar',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 14,
                      fontFamily: kfontRubikMedium),
                ),
                Spacer(),
                Text(
                  '200',
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
              height: 10,
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
                  'Pre-Diabetic',
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
              height: 10,
            ),
            const Doteline(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'HBA1C',
                  style: TextStyle(
                      color: kbyoncolor6,
                      fontSize: 14,
                      fontFamily: kfontRubikMedium),
                ),
                Spacer(),
                Text(
                  '7.0',
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
                  '%',
                  style: TextStyle(
                      color: kbyoncolor7,
                      fontSize: 10,
                      fontFamily: kfontPoppinsMedium),
                ),
                Spacer(),
                Text(
                  'Diabetic',
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

class Doteline extends StatelessWidget {
  const Doteline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: kbyoncolor7,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

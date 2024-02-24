import 'package:byon_care/bottomsheet/loginbottomsheet.dart';
import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController? sheetanimationcontroller;
  AnimationController? animationController;
  Animation? animation;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    sheetanimationcontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController!.forward();
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.ease);
    animationController!.addListener(() {
      if (animationController!.isCompleted == true) {
        loginbottomsheet(context, contoler: sheetanimationcontroller);
      }

      setState(() {});
    });
    sheetanimationcontroller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    sheetanimationcontroller!.dispose();
    animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(bottom: sheetanimationcontroller!.value * 250.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(animation!.value * 6.25),
                    child: GestureDetector(
                      onTap: (){
                        if(animationController!.isCompleted){
                          loginbottomsheet(context);
                        }
                      },
                      child: Image.asset(
                        'images/login.png',
                        height: 140,
                        width: 160,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Nixown',
                style: TextStyle(
                    color: kbyoncolor2,
                    fontSize: 29,
                    fontFamily: kfontPoppinsSemiBold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

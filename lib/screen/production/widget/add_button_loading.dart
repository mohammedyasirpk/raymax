import 'package:flutter/material.dart';

class AddButtonLoading extends StatelessWidget {
  const AddButtonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 3.0,
                            ),
                          ),
                        ],
                      );
  }
}
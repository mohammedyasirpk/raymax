import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
class production_circular_progress_indicator extends StatelessWidget {
  const production_circular_progress_indicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 90,
      width: 90,
      child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            Colors.red,
            Colors.pink,
            Colors.green
          ],
          strokeWidth: 2,
          pathBackgroundColor: Colors.red),
    ));
  }
}
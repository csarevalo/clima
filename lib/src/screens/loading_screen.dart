import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.blue[900],
      height: double.infinity,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox.square(
          //   dimension: 100,
          //   child: CircularProgressIndicator(),
          // ),
          SpinKitSpinningLines(
            size: 100,
            lineWidth: 4.0,
            color: Colors.red,
            duration: Duration(milliseconds: 2000),
          ),
        ],
      ),
    ));
  }
}

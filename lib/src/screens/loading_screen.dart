import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.blueGrey,
      height: double.infinity,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 100,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    ));
  }
}

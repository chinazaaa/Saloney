import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Color(0xFF54C5E6),
              highlightColor: const Color(0xFFFF8C00),
              child: Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text("Please wait...")
          ],
        ),
      ),
    );
  }
}

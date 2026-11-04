import 'package:flutter/material.dart';
import 'Constant/Constant_Color.dart';
import 'Constant/Sizes.dart';

class Circularprogressindicator extends StatelessWidget {
  const Circularprogressindicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sizes.screenHeight * 0.22),
      child: Center(
        child: Container(
          height: Sizes.screenHeight * 0.15,
          width: Sizes.screenHeight * 0.15,
          decoration: BoxDecoration(
            color: AppColor.bgback,
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: Sizes.screenHeight * 0.13,
                width: Sizes.screenHeight * 0.13,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.red,
                ),
              ),
              Image.asset(
                'assets/bgremovelogo.jpg',
                height: Sizes.screenHeight * 0.09,
                width: Sizes.screenHeight * 0.09,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
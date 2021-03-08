import 'package:flutter/material.dart';

class LEDBulb extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color, onColor, offColor;
  final bool isSwitchOn;
  final Duration animationDuration = const Duration(milliseconds: 500);

  const LEDBulb(
      {Key key,
      this.screenWidth,
      this.screenHeight,
      this.color,
      this.onColor,
      this.offColor,
      this.isSwitchOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.442,
      top: isSwitchOn ? screenHeight * 0.17 : screenHeight * 0.17,
      child: Column(children: [
        AnimatedContainer(
          duration: animationDuration,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSwitchOn ? onColor : offColor,
          ),
        ),
      ]),
    );
  }
}

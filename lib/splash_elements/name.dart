import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Name extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color;
  final String roomName;

  const Name(
      {Key key, this.screenWidth, this.screenHeight, this.color, this.roomName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.95,
      left: screenWidth * 0.39,
      width: screenWidth,
      child: Center(
        child: Transform.rotate(
          angle: -1.58,
          child: Text(
            roomName.toUpperCase(),
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

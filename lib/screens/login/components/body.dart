import 'dart:async';

import 'package:animation/size_config.dart';
import 'package:flutter/material.dart';
import 'package:animation/splash_elements/LEDBulb.dart';
import 'package:animation/splash_elements/name.dart';
import 'package:animation/splash_elements/lamp_switch.dart';
import 'package:animation/splash_elements/lamp_switch_rope.dart';
import 'package:animation/splash_elements/lamp_hanger_rope.dart';
import 'package:animation/splash_elements/lamp.dart';

import 'land.dart';
import 'rounded_text_field.dart';
import 'sun.dart';
import 'tabs.dart';

final darkGray = const Color(0xFF232323);
final bulbOnColor = const Color(0xFFFFE12C);
final bulbOffColor = const Color(0xFFC1C1C1);
final animationDuration = const Duration(milliseconds: 500);
bool _isSwitchOn = false;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFullSun = false;
  bool isDayMood = true;
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isFullSun = true;
      });
    });
  }

  void changeMood(int activeTabNum) {
    if (activeTabNum == 0) {
      setState(() {
        isDayMood = true;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isFullSun = true;
        });
      });
    } else {
      setState(() {
        isFullSun = false;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (isFullSun) Color(0xFFFF9D80),
    ];
    var darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.easeInOut,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDayMood ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          Sun(duration: _duration, isFullSun: isFullSun),
          !_isSwitchOn
              ? Positioned(
                  bottom: getProportionateScreenWidth(-65),
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/land_tree_light.png",
                    height: getProportionateScreenWidth(430),
                    fit: BoxFit.fitHeight,
                  ),
                )
              : Positioned(
                  bottom: getProportionateScreenWidth(-65),
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/land_tree_dark.png",
                    height: getProportionateScreenWidth(430),
                    fit: BoxFit.fitHeight,
                  ),
                ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {
                      changeMood(value);
                    },
                  ),
                  VerticalSpacing(),*/
                ],
              ),
            ),
          ),
          LampHangerRope(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              color: darkGray),
          LEDBulb(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            onColor: bulbOnColor,
            offColor: bulbOffColor,
            isSwitchOn: _isSwitchOn,
          ),
          Lamp(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            gradientColor: bulbOnColor,
            animationDuration: animationDuration,
          ),
          LampSwitch(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            toggleOnColor: bulbOnColor,
            toggleOffColor: bulbOffColor,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            onTap: () {
              setState(() {
                changeMood(_isSwitchOn ? 0 : 1);
                _isSwitchOn = !_isSwitchOn;
              });
            },
            animationDuration: animationDuration,
          ),
          LampSwitchRope(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
          ),
          Name(
            screenWidth: screenWidth,
            screenHeight: screenWidth,
            color: darkGray,
            roomName: _isSwitchOn ? "SIGN UP" : "LOGIN",
          ),
        ],
      ),
    );
  }
}

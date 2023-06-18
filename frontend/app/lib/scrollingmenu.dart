import 'package:app/nodefetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'Sign_up.dart';

class ScrollMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: Color.fromARGB(255, 0, 174, 255),
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Color.fromARGB(255, 0, 174, 255),
        ),
        onFinish: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(),
            ),
          )
        },
        skipTextButton: Text(
          'Skip',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        trailingFunction: ()=>{
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          )
        },
        background: [
          Image.asset(
            'assets/images/doctor anime.png',
            height: 350,
            width: 350,
          ),
          Image.asset(
            'assets/images/bike.png',
            height: 350,
            width: 350,
          ),
        ],
        centerBackground: true,
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'Search and get every kind of medicine',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text(
                  'One Click to deliver at your doorstep',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

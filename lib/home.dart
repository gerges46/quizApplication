import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage(this.switchScreen);
 final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/istockphoto-693857936-1024x1024.jpg",
            width: 300,
            // color: Colors.white.withOpacity(0.9),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.amber[50]),
            onPressed: 
       switchScreen,
           
            label: Text(
              "Start Quiz",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            icon: Icon(Icons.arrow_right_alt_outlined),
          ),
        ],
      ),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';

class Login_page extends StatelessWidget {
  const Login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),

          // SizeBox
          SizedBox(
            height: 20,
          ),

          //Text
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Column(
              children: [
                //textform field
                TextFormField(
                
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: 'Username',
                  ),
                ),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: 'Password',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: Text('Login'),
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      print('Login Button Press');
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

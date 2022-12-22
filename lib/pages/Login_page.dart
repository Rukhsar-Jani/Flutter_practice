import 'package:flutter/material.dart';
import 'package:flutter_practice_codepur/utils/routes.dart';

class Login_page extends StatefulWidget {
  Login_page({super.key});


  @override
  State<Login_page> createState() => _Login_pageState();
}

String name = "";
bool changebutton = false;

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
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
              "Welcome $name",
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),

                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: 'Password',
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      changebutton = true;
                      
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.pushNamed(context, Myroutes.Homeroutes);
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(seconds: 1),

                      width: changebutton ? 80 : 150,
                      height: 50,
                      // color: Colors.deepPurple,
                      child:changebutton? Icon(Icons.done,
                      color: Colors.black,)
                      :Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(137, 61, 24, 24),
                        borderRadius: BorderRadius.circular(changebutton? 15: 8),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30),
                  //   child: ElevatedButton(
                  //     child: Text(
                  //       'Login',
                  //       style: TextStyle(fontSize: 22),
                  //     ),
                  //     style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, Myroutes.Homeroutes);
                  //     },
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

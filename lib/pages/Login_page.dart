import 'package:flutter_practice_codepur/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Login_page extends StatefulWidget {
  Login_page({super.key});


  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {

String name = "";
bool changebutton = false;


final _formkey = GlobalKey<FormState>();
moveToHome(BuildContext context)async{
  if(_formkey.currentState!.validate());
  
   setState(() {
changebutton = true;
});
await Future.delayed(Duration(seconds: 2));
await Navigator.pushNamed(context, Myroutes.homeroutes);
setState(() {
changebutton = false;
});       
}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              //Image
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
                
               // Column
                child: Column(
                  children: [
                    //textform field
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your name";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 12,),
        
                    TextFormField(
                      
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Password",
                        labelText: 'Password',
                      ),

                        validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your Password";
                        } else if(value.length < 8){
                          return "Password must be 8carector";
                        }
                       },
                    ),
        
                    SizedBox(
                      height: 30,
                    ),
                    
                    Material(
                        color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular
                            (changebutton? 15: 8),
                      child: InkWell(
                        onTap: () => moveToHome(context) ,
                         
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(seconds: 1),
                    
                          width: changebutton ? 80 : 150,
                          height: 50,
                          // color: Colors.deepPurple,
                          child:changebutton? Icon(Icons.done,
                          color: Colors.black,)
                          :Text("Login",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // decoration: BoxDecoration(
                          //   color: Color.fromARGB(137, 61, 24, 24),
                          //   borderRadius: BorderRadius.circular(changebutton? 15: 8),
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
      ),
    );
  }
}

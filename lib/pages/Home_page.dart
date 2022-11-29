import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//backgroundColor: Colors.black,
        title: Text('flutter 8hours course'),
      ),
      body: Center(
        child: Container(
         child: Text("welcome to shaheen devs team"), 
        ),
      ),
    );
    
  }
}

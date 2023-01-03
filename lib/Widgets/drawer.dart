import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Imageurl = "file:///C:/Users/Lenovo/Downloads/download.jpg";
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
          
          DrawerHeader(
            padding: EdgeInsets.zero,
            child:UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 79, 76, 76),
              ),
              margin: EdgeInsets.zero,
              accountName: Text("Rukhsar"), 
            accountEmail: Text("Rukhsar440@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(Imageurl),
            )
            ) ,
            ),

            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text ("Home",textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
            ),
             ListTile(
              leading: Icon(CupertinoIcons.person,color: Colors.white,),
              title: Text ("Profile",textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
            ) ,
            ListTile(
              leading: Icon(CupertinoIcons.settings,color: Colors.white,),
              title: Text ("Setting",textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
            ),
             ListTile(
              leading: Icon(CupertinoIcons.money_euro,color: Colors.white,),
              title: Text ("Money",textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
            )
            
        ]
        ),
      ),
    );
    
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randomtalks/screens/chatroom.dart';
import 'package:randomtalks/screens/sighin.dart';

String FinalEmail;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _auth = FirebaseAuth.instance;
  List<Widget> addedlist = [];
  Widget addedwid(String mainheading, String discription){
    return Column(children: [
      Text(mainheading),
      Text(discription)

    ],);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,),
          actions: <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.account_circle_outlined,
          size: 32,
        ),
      )
    ),
    Column(children: [
          IconButton(icon: Icon(Icons.logout), onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => SignIn()));
          })
        ],),
    ]
        
      ),
      body: Column(
        children: [
        TextButton(onPressed: (){
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => ChatRoom()));
        }, child: Text('chatroom'),
        )
      ,
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: addedlist),
      FlatButton(onPressed: (){
        setState(() {
          addedlist.add(addedwid("arun", "thacharuthodi"));
        });

      }, child: Text("data"))],),
    );
  }
}
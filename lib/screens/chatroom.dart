
import 'package:flutter/material.dart';
import 'package:randomtalks/screens/home.dart';
import 'package:randomtalks/widgets/widgets.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {


  List ChatWidgets;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon:Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => HomePage()));          

          },
        ),
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
    ),]
        ),
      body: Column(
        children: [Container(
           height: MediaQuery.of(context).size.height -160,

           
        ),
        
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 4),
             child: TextFormField(
               decoration: InputDecoration(hintText: 'type a massage',
               border: OutlineInputBorder(),
               suffixIcon: IconButton(
                 icon: Icon(Icons.send),
                onPressed: () {  },
               )
               ),
             ),
           ),
          ],),
        )
        ]),
    );
  }
}
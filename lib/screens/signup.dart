import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randomtalks/screens/home.dart';
import 'package:randomtalks/screens/sighin.dart';
import 'package:randomtalks/widgets/widgets.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:randomtalks/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  bool tikstate = false;
  bool outsideornot = false;
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  void OutSider(){

  }

  var OutSidersWidget = List<Widget>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height -200 ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  
                  decoration: InputDecoration(
                    hintText: "First Name"
                    
                  ),
                ),
                SizedBox(height:20 ,),
                TextFormField(
                  
                  decoration: InputDecoration(
                    hintText: "Last Name"
                    
                  ),
                ),
                SizedBox(height:20 ,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email address"
                    
                  ),
                ),
                SizedBox(height:20 ,),
                TextFormField(
                  controller: passwordController,
                  
                  decoration: InputDecoration(
                    hintText: "password"
                    
                  ),
                ),
                SizedBox(height:20 ,),
                TextFormField(
                  
                  decoration: InputDecoration(
                    hintText: "Re enter password"
                    
                  ),
                ),
                // Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text("not a student from Gecwayanad"),
  //                 Checkbox(value: tikstate , onChanged:(bool){
  //                 setState(() {
                      
  //                   tikstate = !tikstate;
  //                   if(tikstate == true){
  //                   OutSidersWidget.add(Container(
  //   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //    Row(
  //      children: [
  //      Text("are you from outside of gec wayanad ?"),
  //      Checkbox(value: outsideornot, onChanged: (bool){
  //        setState(() {
  //          outsideornot = !outsideornot;
  //        });
  //      })
  //    ],),
  //     TextFieldCustom("Last name"),
      
  //   ],),
  // ));
  //                   }else {
  //                     OutSidersWidget.removeLast();
  //                   }
  //                 });
  //             }),


  //               ],
  //             ),
  //                           Container(
  //               child: Column(
  //                 children: OutSidersWidget,
  //               ),
  //             )
                SizedBox(height:50 ,),
                GestureDetector(
                onTap: (){
                  _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  FirebaseAuth.instance
                  .authStateChanges()
                  .listen((User user) {
                    if (user == null) {
                      print('User is currently signed out!');
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => HomePage()));
                    }
                  });

                },
                  child: Container(
                            
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15,),
                child: Text("SignUp",style: TextStyle(fontSize: 18, color: Colors.white, ),textAlign: TextAlign.center),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff007EF4),
                    const Color(0xff2A75BC)
                  ]),
                  borderRadius: BorderRadius.circular(10) ),
                
              ),
              ),
                SizedBox(height:20 ,),
                Text("OR"),
                SizedBox(height:10 ,),
                GoogleSignInButton(
                   text: "Signup with Google",
                   onPressed: () {/* ... */},  // default: false
                ),
                SizedBox(height:20 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("do you already have a account?"),
                    GestureDetector(onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => SignIn()));
                    },
                      child: Text("Sign in here",style: TextStyle(decoration:TextDecoration.underline,))),
                  ],
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
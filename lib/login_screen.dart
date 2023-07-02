import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music_chat/registation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade800,
                Colors.deepPurple.shade900,
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )
        ),
        child: Column(
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                  width: 250,
                  height: 250,
                  child: Image(image: AssetImage("assets/logo.png"))),
            ),
            SizedBox(height: 50,),
            Text('Get ready!!!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade400,
              ),
            ),
            SizedBox(height: 20,),
            TextField(
                onChanged: (value){
                  email=value;
                  print(email);
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ) ,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email, color: Colors.purpleAccent,),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.white)
                )
            ),
            SizedBox(height: 10,),
            TextField(
              obscureText: true,
                onChanged: (value){
                  password=value;
                  print(password);
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ) ,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.purpleAccent,),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.white)
                ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade400,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),

                child: Text('Đăng nhập', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                onPressed: (){

                },
              )
            ),
            SizedBox(height: 20,),
            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                children: <TextSpan> [
                  TextSpan(
                    text: "Register here",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.pink,
                    ),
                    recognizer: TapGestureRecognizer() .. onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistationScreen()));
                    }
                  )
                ],
                style: TextStyle(color: Colors.purpleAccent, fontSize: 14),
              )
            )

          ],
        ),
      ),
    );
  }
}

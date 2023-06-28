import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
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
            Container(
              width: 250,
                height: 250,
                child: Image(image: AssetImage("assets/logo.png"))),
            SizedBox(height: 50,),
            Text('Đăng nhập',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            ),
            TextField(
              onChanged: (value){

              },
              decoration: InputDecoration(
                hintText: "Enter your email",
                
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_chat/services/auth_service.dart';
class RegistationScreen extends StatefulWidget {
  const RegistationScreen({Key? key}) : super(key: key);

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {

  String email = "";
  String password = "";
  String fullName = "";
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(color: Colors.purple.shade100,),)
          : Container(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade800,
                Colors.deepPurple.shade900,
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    )),
                Expanded(child: Container()),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 24,
                    )),
              ],
            ),
            SizedBox(height: 15,),
            Hero(
              tag: 'logo',
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image(image: AssetImage("assets/logo.png"))),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'About to Start!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                onChanged: (value) {
                  fullName = value;
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    labelText: 'Fullname',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purpleAccent,
                    ),
                    hintText: 'Enter your fullname',
                    hintStyle: TextStyle(color: Colors.white))),
            SizedBox(
              height: 10,
            ),
            TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.purpleAccent,
                    ),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.white))),
            SizedBox(
              height: 10,
            ),
            TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purpleAccent,
                    ),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: Colors.white))),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))
                  ),
                  child: Text('Đăng kí', style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                  onPressed: () {
                    register();
                  }
              ),
            )
          ],
        ),
      ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.registorUserWithEmailAndPassword(
          fullName, email, password).then((value) {
        if (value == true) {

        }
        else {
          _isLoading = false;
        }
      });
    }
  }
}

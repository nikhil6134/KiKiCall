import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:kikicall/variable.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: GradientColors.blue),
            ),
            child: Center(
              child: Image.asset(
                'images/kikicall2.png',
                height: 200,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: TextField(
                      controller: emailController,
                      style: mystyle(18, Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: " Email",
                          prefix: Icon(Icons.email),
                          hintStyle: mystyle(20, Colors.grey, FontWeight.w700)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: TextField(
                      controller: passwordController,
                      style: mystyle(18, Colors.black),
                      decoration: InputDecoration(
                          hintText: " Password",
                          prefix: Icon(Icons.lock),
                          hintStyle: mystyle(20, Colors.grey, FontWeight.w700)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        int count = 0;
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        Navigator.popUntil(context, (route) {
                          return count++ == 2;
                        });
                      } catch (e) {
                        print(e);
                        var snackbar = SnackBar(
                            content: Text(
                          e.toString().substring(38),
                          style: mystyle(20),
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradientColors.beautifulGreen),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "SIGN IN",
                          style: mystyle(25, Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kikicall/screens/NavigateAuthScreen.dart';
import 'package:kikicall/variable.dart';

class IntroAuthScreen extends StatefulWidget {
  const IntroAuthScreen({Key? key}) : super(key: key);

  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Welcome",
            body: "Welcome to KiKiCall, the best video conferencing app",
            image: Center(
              child: Image.asset(
                'images/welcome.png',
                height: 175,
              ),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black),
            )),
        PageViewModel(
            title: "Join or start meetings",
            body:
                "Easy to use interface, join or start meetings in a fast time",
            image: Center(
              child: Image.asset(
                'images/conference.png',
                height: 175,
              ),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black),
            )),
        PageViewModel(
            title: "Security",
            body:
                "Your Security is important for us. Our servers are secure & reliable",
            image: Center(
              child: Image.asset(
                'images/secure.jpg',
                height: 175,
              ),
            ),
            decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black),
            ))
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      onSkip: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        "Done",
        style: mystyle(20, Colors.black),
      ),
    );
  }
}

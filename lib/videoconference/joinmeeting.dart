import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:kikicall/variable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({Key? key}) : super(key: key);

  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  bool isVideoMuted = true;
  bool isAudioMuted = true;
  String username = ' ';

  @override
  void initState() {
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    DocumentSnapshot userdoc =
        await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();

    setState(() {
      username = (userdoc.data() as dynamic)['username'];
    });
  }

  joinmeeting() async {
    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false
      };
      if (Platform.isAndroid) {
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var options = JitsiMeetingOptions(room: roomController.text)
        ..userDisplayName =
            nameController.text == ' ' ? username : nameController.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlags.addAll(featureFlags);

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Room Code",
              style: mystyle(20),
            ),
            SizedBox(
              height: 20,
            ),
            PinCodeTextField(
              controller: roomController,
              appContext: context,
              length: 6,
              onChanged: (value) {},
              autoDisposeControllers: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(shape: PinCodeFieldShape.underline),
              animationDuration: Duration(milliseconds: 300),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: nameController,
              style: mystyle(20),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name (Leave if you want your username ) ",
                labelStyle: mystyle(15),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CheckboxListTile(
              value: isVideoMuted,
              onChanged: (value) {
                setState(() {
                  isVideoMuted = value!;
                });
              },
              title: Text(
                "Video Muted",
                style: mystyle(18, Colors.black),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CheckboxListTile(
              value: isAudioMuted,
              onChanged: (value) {
                setState(() {
                  isAudioMuted = value!;
                });
              },
              title: Text(
                "Audio Muted",
                style: mystyle(18, Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ofcourse , you can customise your settings in the meeting",
              style: mystyle(15),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 48,
              thickness: 2.0,
            ),
            InkWell(
              onTap: joinmeeting,
              child: Container(
                width: double.maxFinite,
                height: 64,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: GradientColors.purpleDivision)),
                child: Center(
                  child: Text(
                    "Join Meeting",
                    style: mystyle(20, Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:kikicall/variable.dart';
import 'package:kikicall/videoconference/createmeeting.dart';
import 'package:kikicall/videoconference/joinmeeting.dart';

class VideoConferencingScreen extends StatefulWidget {
  const VideoConferencingScreen({Key? key}) : super(key: key);

  @override
  _VideoConferencingScreenState createState() =>
      _VideoConferencingScreenState();
}

class _VideoConferencingScreenState extends State<VideoConferencingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  buildtab(String name) {
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(
            name,
            style: mystyle(17, Colors.black, FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "KikiCall",
          style: mystyle(20, Colors.white, FontWeight.w700),
        ),
        bottom: TabBar(
            controller: tabController,
            tabs: [buildtab("Create Meeting"), buildtab("Join Meeting")]),
      ),
      body: TabBarView(controller: tabController, children: [
        CreateMeeting(),
        JoinMeeting(),
      ]),
    );
  }
}

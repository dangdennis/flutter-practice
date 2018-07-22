import "package:flutter/material.dart";
import "chatscreen.dart";

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "Friendlychat", home: ChatScreen());
  }
}

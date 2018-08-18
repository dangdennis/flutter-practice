import "package:flutter/material.dart";
import 'package:flutter/foundation.dart';
import "chatscreen.dart";

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: ChatScreen(),
      theme: defaultTargetPlatform == TargetPlatform.iOS //new
          ? kIOSTheme //new
          : kDefaultTheme,
    );
  }
}

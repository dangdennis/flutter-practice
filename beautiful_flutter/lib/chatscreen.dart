import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text('Friendlychat')),
        body: _buildTextComposer());
  }

  final TextEditingController _textController = TextEditingController();

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: TextField(
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: InputDecoration.collapsed(
                            hintText: "Send a message"))),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () =>
                            _handleSubmitted(_textController.text)))
              ],
            )));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}

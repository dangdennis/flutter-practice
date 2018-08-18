import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './chatmessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Friendlychat'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Container(
          //modified
          child: new Column(
            //modified
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                decoration:
                    new BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS //new
              ? new BoxDecoration(
                  //new
                  border: new Border(
                    //new
                    top: new BorderSide(color: Colors.grey[200]), //new
                  ), //new
                ) //new
              : null),
    );
  }

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;

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
                        onChanged: (String text) {
                          setState(() {
                            _isComposing = text.length > 0;
                          });
                        },
                        onSubmitted: _handleSubmitted,
                        decoration: InputDecoration.collapsed(
                            hintText: "Send a message"))),
                new Container(
                    margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: Theme.of(context).platform == TargetPlatform.iOS
                        ? //modified
                        new CupertinoButton(
                            //new
                            child: new Text("Send"), //new
                            onPressed: _isComposing //new
                                ? () =>
                                    _handleSubmitted(_textController.text) //new
                                : null,
                          )
                        : //new
                        new IconButton(
                            //modified
                            icon: new Icon(Icons.send),
                            onPressed: _isComposing
                                ? () => _handleSubmitted(_textController.text)
                                : null,
                          )),
              ],
            )));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
        text: text,
        animationController: AnimationController(
            duration: Duration(milliseconds: 500), vsync: this));
    if (text.length > 0) {
      setState(() {
        _messages.insert(0, message);
      });
    }
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) //new
      message.animationController.dispose(); //new
    super.dispose();
  }
}

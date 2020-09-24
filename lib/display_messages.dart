import 'package:flutter/material.dart';

class DisplayMessages extends StatefulWidget {
  @override
  _DisplayMessagesState createState() => _DisplayMessagesState();
}

class _DisplayMessagesState extends State<DisplayMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Nothing Here Yet, Come Back Later",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}

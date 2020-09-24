import 'package:flutter/material.dart';

class DisplayMessages extends StatefulWidget {
  @override
  _DisplayMessagesState createState() => _DisplayMessagesState();
}

class _DisplayMessagesState extends State<DisplayMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'Happy Birthday',
                                  style: TextStyle(
                                    fontFamily: 'LimeLight',
                                    fontSize: 38,
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  'to the best Dad in the world!!',
                                  style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: _buildStack(),
                        ),
                      ],
                    ),
                  ),
                  // List of messages
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          'Happy birthday Ademola!!',
                          style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        // ignore: sdk_version_set_literal
                        Column(
                          children:
                              List.generate(this.messages.length, (index) {
                            var item = this.messages[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Card(
                                elevation: 10,
                                color: Colors.teal[50],
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(item['name']),
                                      subtitle: Text(item['message']),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Stack _buildStack() {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.loose,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            color: Colors.yellow[100],
            child: SizedBox(
              height: 120,
              width: 100,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            color: Colors.red[200],
            child: SizedBox(
              height: 120,
              width: 100,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image(
              image: AssetImage('images/dad.jpg'),
              height: 160,
            ),
          ),
        )
      ],
    );
  }

  final messages = [
    {
      "name": 'Busola',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'Oba',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'pelumi',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'funmi',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'delay',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'Busola',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'Oba',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'pelumi',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'funmi',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
    {
      "name": 'delay',
      "message": "Lorem ipsum dolor acme, nert meki fkri vbs aj vfjf hs"
    },
  ];
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          )
                        ]),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Birthday Message",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.teal),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                hintText: "Name",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal.withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                              keyboardType: TextInputType.multiline,
                              decoration: new InputDecoration(
                                hintText: "Message",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal.withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () {},
                            child: Text(
                              "Send Message",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.teal,
                            shape: StadiumBorder(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
//            TextField(
//              decoration: InputDecoration(
//                filled: true,
//                border: InputBorder.none,
//                hintText: 'Name',
//              ),
//              controller: nameController,
//            ),
//            SizedBox(height: 12.0),
//
//            TextField(
//              decoration: InputDecoration(
//                border: InputBorder.none,
//                filled: true,
//                hintText: 'Message',
//              ),
//              controller: messageController,
//              keyboardType: TextInputType.multiline,
//            ),
            ],
          ),
        ),
      ),
    );
  }
}

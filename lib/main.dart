import 'package:daddys_birthday_app/api/api_service.dart';
import 'package:daddys_birthday_app/message_model.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'display_messages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(576, name: 'SM'),
          ResponsiveBreakpoint.autoScale(768, name: 'MD'),
          ResponsiveBreakpoint.autoScale(992, name: 'LG'),
          ResponsiveBreakpoint.resize(1200, name: 'XL'),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Colors.tealAccent[100],
        ),
      ),
      title: 'Happy Birthday',
      routes: {
        "/": (context) => DisplayMessages(),
        "/send-message": (context) => MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: TextTheme(
              headline1: TextStyle(fontFamily: 'LimeLight'),
              headline2: TextStyle(fontFamily: 'LimeLight'),
              headline3: TextStyle(fontFamily: 'LimeLight'),
              headline4: TextStyle(fontFamily: 'LimeLight'),
              headline5: TextStyle(fontFamily: 'LimeLight'),
              headline6: TextStyle(fontFamily: 'LimeLight'),
              subtitle1: TextStyle(fontFamily: 'JosefinSans'),
              subtitle2: TextStyle(fontFamily: 'JosefinSans'),
              bodyText1: TextStyle(fontFamily: 'JosefinSans'),
              bodyText2: TextStyle(fontFamily: 'JosefinSans'),
              caption: TextStyle(fontFamily: 'JosefinSans'),
              button: TextStyle(fontFamily: 'JosefinSans'),
              overline: TextStyle(fontFamily: 'JosefinSans'))),
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
  MessageRequestModel requestModel;
  ButtonState stateTextWithIcon = ButtonState.idle;

  Widget buildTextWithIcon() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Send Message",
          icon: Icon(Icons.send, color: Colors.white),
          color: Colors.teal),
      ButtonState.loading: IconedButton(text: "Loading", color: Colors.teal),
      ButtonState.fail: IconedButton(
          text: "Failed",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: "Thank You",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400)
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }

  @override
  void initState() {
    super.initState();
    requestModel = new MessageRequestModel();
  }

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
                  LimitedBox(
                    maxWidth: 500,
                    child: Container(
                      // width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      margin:
                          EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
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
                              "Birthday Message for Ademola Okeowo",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'LimeLight',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.teal),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            new TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                cursorColor: Colors.teal,
                                onSaved: (input) => requestModel.name = input,
                                decoration: new InputDecoration(
                                  hintText: "Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal.withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            new TextFormField(
                                controller: messageController,
                                autocorrect: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                keyboardType: TextInputType.multiline,
                                cursorColor: Colors.teal,
                                maxLines: null,
                                onSaved: (input) =>
                                    requestModel.message = input,
                                decoration: new InputDecoration(
                                  hintText: "Message",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal.withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.teal,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            buildTextWithIcon(),
//                          FlatButton(
//                            padding: EdgeInsets.symmetric(
//                                vertical: 12, horizontal: 80),
//                            onPressed: () {
//                              final form = globalFormKey.currentState;
//                              form.save();
//                              print(requestModel.toJson());
//                            },
//                            child: Text(
//                              "Send Message",
//                              style: TextStyle(
//                                color: Colors.white,
//                              ),
//                            ),
//                            color: Colors.teal,
//                            shape: StadiumBorder(),
//                          ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;

        final form = globalFormKey.currentState;
        form.save();
        APIService apiService = new APIService();
        apiService.sendMessage(requestModel).then((value) => {
              setState(() {
                stateTextWithIcon = ButtonState.success;
                nameController.text = "";
                messageController.text = "";
              }),
              Future.delayed(Duration(seconds: 10), () {
                setState(() {
                  stateTextWithIcon = ButtonState.idle;
                });
              })
            });
        print(requestModel.toJson());

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }
}

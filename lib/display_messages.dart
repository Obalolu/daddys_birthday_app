import 'package:flutter/material.dart';
import 'package:daddys_birthday_app/message_model.dart';
import 'package:daddys_birthday_app/api/api_service.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid/responsive_grid.dart';

class DisplayMessages extends StatefulWidget {
  @override
  _DisplayMessagesState createState() => _DisplayMessagesState();
}

class _DisplayMessagesState extends State<DisplayMessages> {
  final _apiService = new APIService();

  /// Handle the proccess of getting message
  FutureBuilder<MessageResponse> messages(BuildContext context) {
    return FutureBuilder<MessageResponse>(
        future: _apiService.getAllMessages(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // Uncompleted State
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              // Completed with error
              if (snapshot.hasError) {
                return Container(child: Text(snapshot.error.toString()));
              }
              final messages = snapshot.data.data.messages;

              return Column(
                children: messages
                    .map(
                      (item) => Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        elevation: 5,
                        color: Colors.teal[50],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            textDirection: TextDirection.ltr,
                            children: [
                              Text(
                                item.name.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                item.message,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
          }
        });
  }

  dynamic responsiveValue(dynamic sm, {dynamic md, dynamic lg, dynamic xl}) {
    return ResponsiveWrapper.of(context).isSmallerThan('SM')
        ? sm
        : ResponsiveWrapper.of(context).isSmallerThan('MD')
            ? (md ?? sm)
            : ResponsiveWrapper.of(context).isSmallerThan('LG')
                ? (lg ?? md ?? sm)
                : (xl ?? lg ?? md ?? sm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: ResponsiveRowColumn(
                    rowCrossAxisAlignment: CrossAxisAlignment.center,
                    rowColumn: true,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Expanded(
                          child: ResponsiveRowColumn(
                            rowColumn: true,
                            children: [
                              ResponsiveRowColumnItem(
                                child: Expanded(
                                  child: ListTile(
                                    title: Text(
                                      'Happy ${responsiveValue(" ", xl: "\n")}Birthday',
                                      style: TextStyle(
                                        fontFamily: 'LimeLight',
                                        fontSize: responsiveValue(28,
                                            md: 42, lg: 52, xl: 64),
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "to the best Dad in the world!! \nthe developer's developer",
                                      style: TextStyle(
                                        fontFamily: 'JosefinSans',
                                        fontSize: responsiveValue(20,
                                            md: 23, lg: 28, xl: 30),
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Expanded(
                          child: _buildStack(),
                        ),
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
                        'Happy birthday Ademola Okeowo!!',
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      messages(context),
                    ],
                  ),
                )
              ],
            ),
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
            decoration: new BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            child: SizedBox(
              height: responsiveValue(100, md: 200),
              width: responsiveValue(80, md: 140),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            child: SizedBox(
              height: responsiveValue(100, md: 200),
              width: responsiveValue(80, md: 140),
            ),
          ),
        ),
        SizedBox(
          height: responsiveValue(250, md: 350, lg: 550, xl: 650),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            padding:
                EdgeInsets.all(responsiveValue(20, md: 40, lg: 40, xl: 40)),
            child: Image(
              image: AssetImage('images/dad-2.jpg'),
            ),
          ),
        )
      ],
    );
  }
}

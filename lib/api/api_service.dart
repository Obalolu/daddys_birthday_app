import 'package:daddys_birthday_app/message_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'dart:io';
import 'dart:async';

String url = "https://dads-birthday.herokuapp.com/api/messages";

class APIService {
  Future<MessageResponseModel> sendMessage(
      MessageRequestModel requestModel) async {
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 201) {
      return MessageResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<MessageResponse> getAllMessages() async {
    final response = await http.get('$url?limit=1000');
    print(response.body);
    return MessageResponse.fromJson(json.decode(response.body));
  }
}

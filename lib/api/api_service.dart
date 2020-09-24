import 'package:daddys_birthday_app/message_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class APIService {
  Future<MessageResponseModel> sendMessage(MessageRequestModel requestModel) async {
    String url = "https://dads-birthday.herokuapp.com/api/messages";
    final response = await http.post(url, body: requestModel.toJson());
    if(response.statusCode == 201) {
      return MessageResponseModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception('Failed to load Data');
    }
  }
}
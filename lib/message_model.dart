class MessageResponseModel {
  final String error;

  MessageResponseModel({this.error});

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(
        error: json["error"] != null ? json["error"] : "");
  }
}

class MessageRequestModel {
  String name;
  String message;

  MessageRequestModel({
    this.name,
    this.message,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
      'message': message.trim(),
    };

    return map;
  }
}

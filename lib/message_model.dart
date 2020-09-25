import 'dart:convert';

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

// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

MessageResponse messageFromJson(String str) =>
    MessageResponse.fromJson(json.decode(str));

String messageToJson(MessageResponse data) => json.encode(data.toJson());

class MessageResponse {
  MessageResponse({
    this.code,
    this.data,
    this.success,
    this.message,
  });

  int code;
  MessageData data;
  bool success;
  String message;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      MessageResponse(
        code: json["code"],
        data: MessageData.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "success": success,
        "message": message,
      };
}

class MessageData {
  MessageData({
    this.total,
    this.totalPages,
    this.currentPage,
    this.limit,
    this.previousPage,
    this.nextPage,
    this.messages,
  });

  int total;
  int totalPages;
  int currentPage;
  int limit;
  int previousPage;
  int nextPage;
  List<MessageElement> messages;

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
        total: json["total"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        limit: json["limit"],
        previousPage: json["previousPage"],
        nextPage: json["nextPage"],
        messages: List<MessageElement>.from(
            json["messages"].map((x) => MessageElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalPages": totalPages,
        "currentPage": currentPage,
        "limit": limit,
        "previousPage": previousPage,
        "nextPage": nextPage,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class MessageElement {
  MessageElement({
    this.id,
    this.name,
    this.organisation,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  dynamic organisation;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  factory MessageElement.fromJson(Map<String, dynamic> json) => MessageElement(
        id: json["id"],
        name: json["name"],
        organisation: json["organisation"],
        message: json["message"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "organisation": organisation,
        "message": message,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

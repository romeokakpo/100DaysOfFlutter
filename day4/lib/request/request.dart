import 'dart:convert';
import 'package:day4/models/chat_model.dart';
import 'package:day4/request/api_key.dart';
import 'package:http/http.dart' as http;
import '../models/list_model.dart';

class Request {
  static Future<ListModel> getModels() async {
    try {
      var response = await http.get(Uri.https("api.openai.com", "/v1/models"),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        return ListModel.fromJSON(jsonDecode(response.body)["data"]);
      } else {
        throw Exception("Unable to load data");
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  static Future<List<ChatModel>> setMessage(String msg, String modelId) async {
    try {
      var response = await http.post(
          Uri.https("api.openai.com", "/v1/chat/completions"),
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            "model": modelId,
            "messages": [
              {
                "role": "user",
                "content": msg,
              }
            ]
          }));
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw Exception(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse["choices"].length > 0) {
        chatList = List.generate(
            jsonResponse['choices'].length,
            (index) =>
                ChatModel.fromJson(jsonResponse["choices"][index]["message"]));
      }
      return chatList;
    } catch (error) {
      throw Exception(error);
    }
  }
}

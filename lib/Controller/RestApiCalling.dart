import 'dart:convert';
import 'package:http/http.dart'as http;

List<RestApiCalling> restApiCallingFromJson(String str) => List<RestApiCalling>.from(json.decode(str).map((x) => RestApiCalling.fromJson(x)));

String restApiCallingToJson(List<RestApiCalling> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestApiCalling {
  RestApiCalling({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory RestApiCalling.fromJson(Map<String, dynamic> json) => RestApiCalling(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}




class RequestRestAPI {
  String url = "https://jsonplaceholder.typicode.com/posts";
  Future<List<RestApiCalling>?> myData()async{
  var response = await http.get(Uri.parse(url));
  if(response.statusCode == 200){
    var data = response.body;
    return restApiCallingFromJson(data);
  }
  }
}

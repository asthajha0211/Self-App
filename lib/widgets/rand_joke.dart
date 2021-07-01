// To parse this JSON data, do
//
//     final jokeResponse = jokeResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

JokeResponse jokeResponseFromJson(String str) =>
    JokeResponse.fromJson(json.decode(str));

String jokeResponseToJson(JokeResponse data) => json.encode(data.toJson());

class JokeResponse {
  JokeResponse({
    this.setup,
    this.punchline,
  });

  String setup;
  String punchline;

  factory JokeResponse.fromJson(Map<String, dynamic> json) => JokeResponse(
    setup: json["setup"],
        punchline: json["punchline"],
      );

  Map<String, dynamic> toJson() => {
        "setup": setup,
        "punchline": punchline,
      };
}

Future<JokeResponse> getJoke() async {
  Dio dio = Dio();
try {
    Response response =
        await dio.get('https://official-joke-api.appspot.com/random_joke');
    return JokeResponse.fromJson(response.data);
  } catch (error) {
    print(error);
    return null;
  }
}

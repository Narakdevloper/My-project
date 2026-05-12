import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:narak_news/contant/api_constant.dart';
import 'package:narak_news/models/product_model.dart';

List<Movie> _parseMovies(String body) {
  Map<String, dynamic> json = jsonDecode(body);
  List list = json['results'];
  return list.map((e) => Movie.fromJson(e)).toList();
}

class Serchproduct {
  Future<List<Movie>> serchproduct(String? title) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://api.themoviedb.org/3/search/movie?api_key=$kApiKey&query=$title",
        ),
      );
      if (response.statusCode == 200) {
        List<Movie> items = await compute(_parseMovies, response.body);
        return items;
      } else {
        throw Exception("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class Service {
  Future<List<Movie>> readapi({int page = 1}) async {
    try {
      http.Response response = await http.get(
        Uri.parse("$kBaseUrl &page=$page"),
      );
      if (response.statusCode == 200) {
        return await compute(_parseMovies, response.body);
      } else {
        throw Exception("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'dart:convert';
import 'models.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url = "https://jsonplaceholder.typicode.com/photos";

  static Future<List<Album>> getPhotos() async{
    try {
      final response =await http.get(url);
      if(response.statusCode == 200){
        List<Album> list = parsePhotos(response.body);
        return list;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Album> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json)=>Album.fromJson(json)).toList();
  }
}
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'models.dart';
import 'package:flutter/material.dart';
import 'services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
    
  }
  
  class _HomePageState extends State {

    Future<String> loadPersonFromAssets() async{
      return await rootBundle.loadString('json/person.json');
    }

    Future loadPerson() async{
      String jsonString =await loadPersonFromAssets();
      final jsonResponse =json.decode(jsonString);
      Person person = new Person.fromJson(jsonResponse);
      print('Name ${person.name}');
      print('Places: ${person.places}');
      print('Images: ${person.images[0].name}');
      print('Address: ${person.address.details.town}');

      print("Loading photos...");
      Services.getPhotos().then((albums){
        print('Albums: ${albums.length}');
        print('Album 0: ${albums[0].title}');
      });
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPerson();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
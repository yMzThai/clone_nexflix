import 'package:flutter/material.dart';

class MyImages {
  static const String fullLogo = 'assets/images/NETFLIX_LOGO.png';
  static const String nLogo = 'assets/images/Netflix_N_logo.png';
  static const String kidsLogo = 'assets/images/kids_01.png';
}

class MyStrings {
  static const String whoSWatching = "Who's Watching?";
  static const String manageProfiles = "Manage Profiles";
  static const String editProfile = "Edit Profile";
  static const String choosePicture = "Choose Picture";
}

class MyColors {
  static const Color background = Color(0xFF000000);
  static const Color text = Color(0xFFFFFFFF);
}

class MyIcon {
  static const IconData edit = Icons.create;
  static const IconData back = Icons.arrow_back;
}

class MyProFile {
  static const Map<String, Map<String, int>> _profile =  {
  "A_Series_of_Unfortunate_Evants": {"index":14,"count":9},
  "Ask_the_StoryBots" : {"index":1,"count":6},
  "Black_Mirror" : {"index":2,"count":7},
  "Bright" : {"index":3,"count":3},
  "Carmen_Sandiego" : {"index":4,"count":13},
  "Disenchantment" : {"index":5,"count":6},
  "Larva_Island" : {"index":6,"count":9},
  "Lost_in_Space" : {"index":7,"count":9},
  "Money_Heist" : {"index":8,"count":9},
  "Orange_is_the_New_Black" : {"index":9,"count":10},
  "Our_Planet" : {"index":10,"count":14},
  "Queer_Eye" : {"index":11,"count":5},
  "Stranger_Things" : {"index":12,"count":16},
  "The_Boss_Baby_Back_in_Business" : {"index":13,"count":11},
  "The_Classics" : {"index":0,"count":18},
  "The_Crown" : {"index":14,"count":8},
  "The_Dark_Crystal_Age_of_Resistance" : {"index":15,"count":9},
  "The_Dragon_Prince" : {"index":16,"count":12},
  "The_Witcher" : {"index":17,"count":7},
  "Trollhunters_Tales_of_Arcadia" : {"index":18,"count":8},
  };

  List<String> getKeys(){
    List<String> keys = List.from(_profile.keys);
    keys.sort((a, b) => _profile[a]!["index"]!.compareTo(_profile[b]!["index"]!));
    return keys;
  }

  String _getName(String key){
    return key.replaceAll("_", " ");
  }

  List<String> getImages(String key){
    int count = _profile[key]!["count"]!;
    List<String> images = List.generate(count, (index) => 'assets/images/${key}_${index<=8 ? "0"+(index+1).toString():index+1}.png');
    return images;
  }

  Map<String, dynamic> getData(String key){
    return {"title": _getName(key),"images":getImages(key)};
  }

  String getImage(String key,int index){
    return getImages(key)[index];
  }
}

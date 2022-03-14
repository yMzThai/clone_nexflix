import 'package:flutter/material.dart';

class MyImages {
  static const String fullLogo = 'assets/images/NETFLIX_LOGO.png';
  static const String nLogo = 'assets/images/Netflix_N_logo.png';
  static const String kidsLogo = 'assets/images/kids_01.png';
}

class MyPage {
  static const Map<String, List<IconData>> _pages = {
    "Home": [Icons.home, Icons.home_outlined],
    "Games": [Icons.videogame_asset, Icons.videogame_asset_outlined],
    "Coming Soon": [Icons.video_library, Icons.video_library_outlined],
    "Downloads": [
      Icons.download_for_offline,
      Icons.download_for_offline_outlined
    ]
  };

  List<BottomNavigationBarItem> get bottomNavigationBarItems => _pages.keys
      .map((e) => BottomNavigationBarItem(
          tooltip: '',
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 2.5),
            child: Icon(_pages[e]![1]),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 2.5),
            child: Icon(_pages[e]![0]),
          ),
          label: e))
      .toList();
}

class Poster {
  static const List<String> url = [
    'https://i.pinimg.com/originals/37/29/7b/37297b4d0f00cbe52b40a28fcf1713f9.jpg', // girlboss
    'https://i.pinimg.com/originals/4d/7e/3f/4d7e3f4074144a3f840d161a44d8468a.jpg', // 13 reason why
    'https://i.pinimg.com/236x/66/82/de/6682de94212e3fcb809e1d71477ac2c7.jpg', // you
    'https://i.pinimg.com/236x/d4/6c/82/d46c82a025fcb21e71fb35b87740d207.jpg', // alexa and katie
    'https://i.pinimg.com/236x/6b/39/ee/6b39ee56f70d2df5e682dfb681912c6b.jpg', // birdbox
    'https://i.pinimg.com/236x/d8/81/a8/d881a8e9901b5332ee401296ba1fae57.jpg', // sex ed
    'https://i.pinimg.com/236x/91/31/11/91311148567e68c8c8032b3cc8cf6d2e.jpg', // unbrella acad
    'https://i.pinimg.com/236x/be/1a/24/be1a2426475ad197a4a38969632f68e7.jpg', // riverdal
    'https://i.pinimg.com/236x/0f/cd/fc/0fcdfc052e3e8cb204757820a068f5a6.jpg', // sabrina
    'https://i.pinimg.com/236x/8f/cb/1c/8fcb1c714c88d542229e89e8402af9b6.jpg', // on my block
    'https://i.pinimg.com/236x/fb/fe/43/fbfe43eb5ebe1d9eeb36e75c18cc6bb8.jpg', // lucifer
    'https://i.pinimg.com/236x/c9/33/82/c9338209a5ba15d93fe955b77f2aee79.jpg', // stranger thing
    'https://i.pinimg.com/236x/0b/40/76/0b407634b91db10f96600937fa5b6da0.jpg', // queen gambit
    'https://i.pinimg.com/236x/71/9b/e6/719be62f3c34f5c6cc6c5f9b72a86f52.jpg', //baby
    'https://i.pinimg.com/236x/4a/b7/fb/4ab7fb921db2ab53b175f85a5cd0348e.jpg', //fate
    'https://i.pinimg.com/236x/96/96/51/9696514a0b35626aab6b12b05f7c3ab9.jpg', // the crown
    'https://i.pinimg.com/236x/b1/72/1f/b1721fd5f4c611364f25db12fde8d3f2.jpg', // emily
    'https://i.pinimg.com/236x/70/43/f3/7043f3675da0053fb16b411cf092dfc7.jpg', // cobra kai
    'https://i.pinimg.com/236x/61/b3/2b/61b32b442d6368c465fc4f18552d40ea.jpg', //bridgerton
    'https://i.pinimg.com/236x/ed/05/b9/ed05b9aa4258eaae5fad8c7ee0db6094.jpg', // anne
    'https://i.pinimg.com/236x/c8/18/94/c81894476635c25fa231c86607d1e717.jpg', //oa
  ];
}

class RecShow {
  static const Map<String, String> adam = {
    'file': 'assets/images/the_adam_project.png',
    'type': 'assets/images/netflix_film.png',
    'name': 'assets/images/the_adam_project_name.png'
  };
  static const List<String> genres = [
    'Sci-Fi',
    'Family Movies',
    'Action',
    'Comedies',
    'Family Adventures'
  ];
}

class MyStrings {
  static const String whoSWatching = "Who's Watching?";
  static const String manageProfiles = "Manage Profiles";
  static const String editProfile = "Edit Profile";
  static const String choosePicture = "Choose Picture";
  static const List<String> languages = [
    'Dansk',
    'Deutsch',
    'English',
    'Español',
    'Français',
    'Hrvatski',
    'Indoesia',
    'Italiano',
    'Magyar',
    'Melayu',
    'Nederlands',
    'Norsk bokmål',
    'Polski',
    'Svenska',
    'Tiếng Việt',
    'Türkçe',
    'Čeština',
    'Ελληνικά',
    'Pусский',
    'Українська',
    'עברית',
    'العربية',
    'हिन्दी',
    'ไทย',
    '中文',
    '日本語',
    '한국어'
  ];
}

class MyColors {
  static const Color background = Color(0xFF000000);
  static const Color text = Color(0xFFFFFFFF);
  static const Color softText = Color.fromARGB(255, 218, 218, 218);
  static const Color softBackground = Color.fromARGB(255, 53, 53, 53);
  static const Color btnBackground = Color.fromARGB(255, 39, 39, 39);
  static const Color unselectTab = Color.fromARGB(255, 134, 134, 134);
  static const Color tab = Color.fromARGB(255, 20, 20, 20);
}

class MyIcon {
  static const IconData edit = Icons.create;
  static const IconData back = Icons.arrow_back;
}

class MyProFile {
  static const Map<String, Map<String, int>> _profile = {
    "A_Series_of_Unfortunate_Evants": {"index": 14, "count": 9},
    "Ask_the_StoryBots": {"index": 1, "count": 6},
    "Black_Mirror": {"index": 2, "count": 7},
    "Bright": {"index": 3, "count": 3},
    "Carmen_Sandiego": {"index": 4, "count": 13},
    "Disenchantment": {"index": 5, "count": 6},
    "Larva_Island": {"index": 6, "count": 9},
    "Lost_in_Space": {"index": 7, "count": 9},
    "Money_Heist": {"index": 8, "count": 9},
    "Orange_Is_the_New_Black": {"index": 9, "count": 10},
    "Our_Planet": {"index": 10, "count": 14},
    "Queer_Eye": {"index": 11, "count": 5},
    "Stranger_Things": {"index": 12, "count": 16},
    "The_Boss_Baby_Back_in_Business": {"index": 13, "count": 11},
    "The_Classics": {"index": 0, "count": 18},
    "The_Crown": {"index": 14, "count": 8},
    "The_Dark_Crystal_Age_of_Resistance": {"index": 15, "count": 9},
    "The_Dragon_Prince": {"index": 16, "count": 12},
    "The_Witcher": {"index": 17, "count": 7},
    "Trollhunters_Tales_of_Arcadia": {"index": 18, "count": 8},
  };

  List<String> getKeys() {
    List<String> keys = List.from(_profile.keys);
    keys.sort(
        (a, b) => _profile[a]!["index"]!.compareTo(_profile[b]!["index"]!));
    return keys;
  }

  String _getName(String key) {
    return key.replaceAll("_", " ");
  }

  List<String> getImages(String key) {
    int count = _profile[key]!["count"]!;
    List<String> images = List.generate(
        count,
        (index) =>
            'assets/images/${key}_${index <= 8 ? "0" + (index + 1).toString() : index + 1}.png');
    return images;
  }

  Map<String, dynamic> getData(String key) {
    return {"title": _getName(key), "images": getImages(key)};
  }

  String getImage(String key, int index) {
    return getImages(key)[index];
  }
}

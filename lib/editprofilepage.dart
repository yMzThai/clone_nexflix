import 'package:clone_nexflix/choosepicturepage.dart';
import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key, this.user}) : super(key: key);
  final Map<String, dynamic>? user;

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leadingWidth: 38.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(MyIcon.back)),
      ),
      title: const Text(
        MyStrings.editProfile,
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: MyColors.background,
    );
  }

  Widget _profilePicture() {
    return Center(
      child: SizedBox(
        width: 108,
        height: 108,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  MyProFile().getImage(
                      user!["Profile"]!["key"], user!["Profile"]!["index"]),
                  width: 100,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: MyColors.text,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              width: 26,
              height: 26,
              child: const Icon(
                Icons.create_outlined,
                color: MyColors.background,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userName() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        width: 250,
        child: TextField(
          controller: TextEditingController()..text = user!["Name"],
          cursorColor: MyColors.text,
          decoration: const InputDecoration(
            fillColor: MyColors.btnBackground,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          style: const TextStyle(
            color: MyColors.text,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  Widget _maturityrate() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 180,
        padding: const EdgeInsets.only(top: 12),
        child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: MyColors.softText,
              onSurface: MyColors.softBackground,
              backgroundColor: MyColors.softBackground,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
            ),
            child: Text('all maturity ratings'.toUpperCase())),
      ),
    );
  }

  Widget _accountSetting() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: MyColors.softText),
              children: [
                TextSpan(
                  text: 'Show titles of',
                ),
                TextSpan(
                    text: ' all maturity ratings ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                  text: 'for this profile.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: MyColors.softText,
                ),
                children: [
                  TextSpan(
                    text: 'Visit ',
                  ),
                  TextSpan(
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    text: ' Account Settings ',
                  ),
                  TextSpan(
                    text: 'to change.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mySwitch(bool v) {
    return Switch(
      value: v,
      onChanged: (bool s) {},
      activeColor: MyColors.text,
      activeTrackColor: Colors.blue,
    );
  }

  Widget _switchBtn(
      {String textA = '',
      String textB = 'On all devices',
      bool values = true,
      IconData icons = Icons.create,
      bool switchs = true}) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MyColors.btnBackground,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    icons,
                    size: 26,
                    color: MyColors.softText,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textA,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: MyColors.text,
                      ),
                    ),
                    Text(
                      textB,
                      style: const TextStyle(
                        fontSize: 12,
                        color: MyColors.softText,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: switchs
                    ? _mySwitch(values)
                    : const Icon(
                        Icons.navigate_next,
                        color: MyColors.softText,
                        size: 26,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _deleteUser(){
    return BottomAppBar(
        color: MyColors.background,
        child: Container(
          padding: const EdgeInsets.only(bottom: 20, top:8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.delete,
                  color: MyColors.softText,
                  size: 30,
                ),
              ),
              Text(
                'Delete Profile',
                style: TextStyle(
                    color: MyColors.softText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
  }

  Widget _onClick(BuildContext context, Widget widget) {
    return GestureDetector(
      onTapUp: (index) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChoosePicturePage()));
      },
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: _appBar(context),
      bottomNavigationBar: _deleteUser(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(children: <Widget>[
          _onClick(context, _profilePicture()),
          _userName(),
          _maturityrate(),
          _accountSetting(),
          _switchBtn(
              textA: 'Display Language',
              textB:
                  'Change the languages of the text you see on Netflix across all devices',
              icons: Icons.translate,
              switchs: false),
          _switchBtn(
              textA: 'Audio & Subtitle Languages',
              textB:
                  'Choose the languages you like to watch shows and movies in.',
              icons: Icons.subtitles_outlined,
              switchs: false),
          _switchBtn(
            textA: 'Autoplay Next Episode',
            icons: Icons.smart_display_outlined,
          ),
          _switchBtn(
            textA: 'Autoplay Previews',
            icons: Icons.play_arrow_outlined,
          ),
        ]),
      ),
    );
  }
}

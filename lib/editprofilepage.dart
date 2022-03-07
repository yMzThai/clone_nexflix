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
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: TextField(
        controller: TextEditingController()..text = user!["Name"],
        cursorColor: MyColors.text,
        decoration: const InputDecoration(
            fillColor: Color.fromARGB(255, 39, 39, 39),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        style: const TextStyle(
          color: MyColors.text,
          fontWeight: FontWeight.w200,
          
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
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _onClick(context, _profilePicture()),
              _userName(),
            ]),
      ),
    );
  }
}

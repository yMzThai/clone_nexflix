import 'package:clone_nexflix/constant.dart';
import 'package:clone_nexflix/editprofilepage.dart';
import 'package:clone_nexflix/main2.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList(this.user, {Key? key, required this.edited}) : super(key: key);
  final Map<String, dynamic> user;
  final bool edited;
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  double widthImage = 100;

  Widget _profile(user) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Opacity(
                opacity: widget.edited ? 0.25 : 1,
                child: Image.asset(
                  MyProFile().getImage(
                      user["Profile"]!["key"], user["Profile"]!["index"]),
                  width: widthImage,
                ),
              ),
            ),
          ),
          widget.edited ? _iconEditUser() : const SizedBox()
        ],
      ),
    );
  }

  Widget _iconEditUser() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: MyColors.text,
            width: 2,
          ),
        ),
        width: 46,
        height: 46,
        child: const Icon(
          MyIcon.edit,
          color: MyColors.text,
        ),
      ),
    );
  }

  Widget _textName(user) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6.0),
      child: Text(
        user["Name"],
        style: const TextStyle(fontSize: 12, color: MyColors.text),
      ),
    );
  }

  Widget iconLock() {
    return const Icon(
      Icons.lock_outline,
      color: Colors.grey,
      size: 14,
    );
  }

  Widget unLock() {
    return const SizedBox(height: 14.0);
  }

  AlertDialog alert() {
    return AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Enter your Pin to access this profile.',
            style: TextStyle(color: MyColors.text),
          ),
          //TextField(autofocus: true,
          //keyboardType: TextInputType.number,)
        ],
      ),
      backgroundColor: MyColors.softBackground,
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTapDown: (index) {
        setState(() {
          if (!widget.edited) {
            widthImage = 86;
          }
        });
      },
      onTapUp: (index) {
        setState(() {
          widthImage = 100;
          if (widget.edited) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfilePage(user: widget.user)));
          } else {
            if (widget.user.containsKey('Password')) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return alert();
                  });
            } else {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Main2()),
                  (Route<dynamic> route) => false);
            }
          }
        });
      },
      onTapCancel: () {
        setState(() {
          widthImage = 100;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _profile(widget.user),
          _textName(widget.user),
          widget.user.containsKey("Password") ? iconLock() : unLock()
        ],
      ),
    );
  }
}

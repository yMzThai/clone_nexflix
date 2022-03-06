import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList(
    this.user, {
    Key? key,
  }) : super(key: key);
  final Map<String, dynamic> user;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {


  Widget _profile(user) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        MyProFile()
            .getImage(user["Profile"]!["key"], user["Profile"]!["index"]),
        width: 100,
      ),
    );
  }

  Widget _textName(user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _profile(widget.user),
        _textName(widget.user),
        widget.user.containsKey("Password") ? iconLock() : unLock()
      ],
    );
  }
}

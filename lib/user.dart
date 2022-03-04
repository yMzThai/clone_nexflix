import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool locked = false;

  Widget _profile() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        'https://mir-s3-cdn-cf.behance.net/project_modules/disp/84c20033850498.56ba69ac290ea.png',
        width: 100,
      ),
    );
  }

  Widget _textName() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        'KIRK',
        style: TextStyle(fontSize: 12, color: MyColors.text),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_profile(), _textName(), locked ? iconLock() : unLock()],
    );
  }
}

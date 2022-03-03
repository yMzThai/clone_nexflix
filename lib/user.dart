import 'package:flutter/material.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(5, (index) {
          return Column(
            children: [
              Image.network(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.behance.net%2Fgallery%2F33850498%2FNetflix-Profile-Avatars&psig=AOvVaw08ocOPSdn7EmVPjDUAoOvp&ust=1646401372842000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCID5uaKJqvYCFQAAAAAdAAAAABAD'),
              Text('User name {$index}'),
              const Icon( Icons.lock)
            ],
          );
        }),
      ),
    );
  }
}

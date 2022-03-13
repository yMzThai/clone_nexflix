import 'package:flutter/cupertino.dart';

Widget roundImage(
    {double radius = 8,
    String file = 'asset/images/the_adam_project.png',
    double size = 100}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: Image.asset(
      file,
      width: size,
    ),
  );
}

Widget roundImageNet(
    {double radius = 8,
    String file =
        'https://i.pinimg.com/236x/ed/05/b9/ed05b9aa4258eaae5fad8c7ee0db6094.jpg',
    double size = 100}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: Image.network(
      file,
      height: size,
    ),
  );
}


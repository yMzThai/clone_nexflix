import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

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

Widget recommendShow({Map? file, List<String>? genres}) {
  return Container(
    padding: EdgeInsets.zero,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          file!['file'],
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            Image.asset(
              file['type'],
              width: 28,
            ),
            Image.asset(
              file['name'],
              width: 180,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4, top: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: genresLis(genres),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myInfo(title: 'My List', icon: Icons.add),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: myBtn(title: 'Play', icon: Icons.play_arrow),
                ),
                myInfo(title: 'Info', icon: Icons.info_outline)
              ],
            )
          ],
        )
      ],
    ),
  );
}

List<Widget> genresLis(List<String>? genres) {
  Widget dot = const SizedBox(width: 0);
  List<Widget> genrs = [];
  for (var item in genres!) {
    genrs.add(dot);
    genrs.add(Text(item,
        style: const TextStyle(
          fontSize: 12,
          color: MyColors.text,
        )));
    dot = const Icon(
      Icons.fiber_manual_record,
      color: MyColors.unselectTab,
      size: 5,
    );
  }
  return genrs;
}

Widget myInfo({String? title, IconData? icon}) {
  return Container(
    width: 50,
    alignment: Alignment.center,
    child: Column(
      children: [
        Icon(icon!, color: MyColors.text),
        Text(
          title!,
          style: const TextStyle(color: MyColors.softText),
        )
      ],
    ),
  );
}

Widget myBtn({String? title, IconData? icon}) {
  return Container(
    decoration: BoxDecoration(
      color: MyColors.text,
      borderRadius: BorderRadius.circular(4),
    ),
    padding: const EdgeInsets.only(top: 6, right: 16, bottom: 6, left: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Icon(icon, size: 24,),
      Text(
        title!,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ]),
  );
}

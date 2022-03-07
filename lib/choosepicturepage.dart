import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class ChoosePicturePage extends StatelessWidget {
  const ChoosePicturePage({Key? key}) : super(key: key);

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
        MyStrings.choosePicture,
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: MyColors.background,
    );
  }

  Widget listPicture(String title, List<Widget> images) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18.0, color: MyColors.text),
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: images,
            shrinkWrap: true,
            //physics: const ClampingScrollPhysics(),
          ),
        )
      ],
    );
  }

  Widget image(String uri) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          uri,
          width: 100,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> keyPicture = MyProFile().getKeys();
    List<Widget> listPic = List.generate(keyPicture.length, (index) {
      Map<String, dynamic> data = MyProFile().getData(keyPicture[index]);
      List<String> uris = MyProFile().getImages(keyPicture[index]);
      List<Widget> images =
          List.generate(uris.length, (index) => image(uris[index]));
          
      return listPicture(data["title"], List.from(images.reversed));
    });

    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: _appBar(context),
      body: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: keyPicture.length,
      itemBuilder: (BuildContext context, int index){
        return Container(height: 150,
        padding: const EdgeInsets.all(8.0),
        child: listPic[index],);
      }),
    );
  }
}

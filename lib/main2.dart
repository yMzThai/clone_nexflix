import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class Main2 extends StatefulWidget {
  const Main2({Key? key}) : super(key: key);

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  List<Widget> pages = List.generate(
      4,
      (i) => Center(
          child: Text(i.toString(),
              style: const TextStyle(color: MyColors.text))));
  int index = 0;

  @override
  Widget build(BuildContext context) {
    pages[0] = const homePage();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.text,
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        items: MyPage().bottomNavigationBarItems,
        showUnselectedLabels: true,
        unselectedFontSize: 9.0,
        selectedFontSize: 9.0,
        unselectedItemColor: MyColors.unselectTab,
        selectedItemColor: MyColors.text,
        backgroundColor: MyColors.tab,
        iconSize: 28.0,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double _transparentBg = 0;
  double _visible = 1;
  double _scrollmoving = 0;

  late ScrollController _scrollController;

  AnimatedOpacity _opacityAnime(Widget widget) {
    return AnimatedOpacity(
      opacity: _visible,
      duration: const Duration(milliseconds: 250),
      child: widget,
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _visible = _scrollController.offset > _scrollmoving ? 0 : 1;
          _scrollmoving = _scrollController.offset;
          _transparentBg = _scrollmoving <= 200 ? _scrollmoving / 4 : 50;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              elevation: 0,
              backgroundColor: Color.fromARGB(_transparentBg.toInt(), 0, 0, 0),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _opacityAnime(
                      Image.asset(
                        'assets/images/Netflix_N_logo.png',
                        width: 20,
                      ),
                    ),
                    Row(children: const [
                      Icon(Icons.cast, color: MyColors.background),
                      Icon(Icons.search, color: MyColors.background),
                      Icon(Icons.tune, color: MyColors.background),
                    ]),
                  ]),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    height: 50,
                    child: const Text('aaaa'),
                  )),
            ),
          ];
        },
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: 2000,
              child: const Text('55555'),
            )
          ],
        ),
      ),
    );
  }
}

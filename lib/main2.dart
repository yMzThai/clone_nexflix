import 'package:clone_nexflix/constant.dart';
import 'package:clone_nexflix/customappbar.dart';
import 'package:clone_nexflix/favoritewidget.dart';
import 'package:clone_nexflix/gamespage.dart';
import 'package:flutter/material.dart';

class Main2 extends StatefulWidget {
  const Main2({Key? key, this.user}) : super(key: key);
  final Map<String, dynamic>? user;
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

  List<String> posters = List.from(Poster.url);
  @override
  Widget build(BuildContext context) {
    pages[2] = HomePage(user: widget.user);
    pages[1] = GamesPage(user: widget.user);
    pages[0] = CusttomSlivereditor(user: widget.user, lists: [
      recommendShow(file:RecShow.adam, genres: RecShow.genres),
      listViewHoriz(title: 'My List', listPoster: posters..shuffle()),
      listViewHoriz(title: 'Continue Watching', listPoster: posters..shuffle()),
      listViewHoriz(title: 'Recently Added', listPoster: posters..shuffle()),
      listViewHoriz(title: 'Trending Now', listPoster: posters..shuffle()),
      listViewHoriz(
          title: 'Only on Netflix', listPoster: posters..shuffle(), size: 300),
      listViewHoriz(title: 'New Releases', listPoster:posters..shuffle()),
      listViewHoriz(
          title: 'Award-winning Visually-striking Western Moview/Series',
          listPoster: posters..shuffle())
    ]);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.background,
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

  Widget listViewHoriz(
      {String? title, List<String>? listPoster, double size = 175}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, left: 8),
            child: Wrap(
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyColors.text),
                )
              ],
            ),
          ),
          SizedBox(
            height: size,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: insideList(listPoster: listPoster, size: size),
            ),
          )
        ]);
  }

  List<Widget> insideList({List<String>? listPoster, double? size}) {
    List<Widget> piclist = List.generate(
        listPoster!.length,
        (i) => Padding(
              padding: const EdgeInsets.all(6),
              child: roundImageNet(file: listPoster[i], size: (size! - 12.0)),
            ));
    return piclist;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.user}) : super(key: key);
  final Map<String, dynamic>? user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _transparentBg = 0;
  // double _visible = 1;
  double _scrollmoving = 0;

  late ScrollController _scrollController;

  // AnimatedOpacity _opacityAnime(Widget widget) {
  //   return AnimatedOpacity(
  //     opacity: _visible,
  //     duration: const Duration(milliseconds: 250),
  //     child: widget,
  //   );
  // }

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          // _visible = _scrollController.offset > _scrollmoving ? 0 : 1;
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
                    Image.asset(
                      'assets/images/Netflix_N_logo.png',
                      width: 20,
                    ),
                    Row(children: [
                      const Icon(Icons.cast, color: MyColors.background),
                      const Icon(Icons.search, color: MyColors.background),
                      const Icon(Icons.tune, color: MyColors.background),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          MyProFile().getImage(widget.user!["Profile"]!["key"],
                              widget.user!["Profile"]!["index"]),
                          width: 24,
                        ),
                      )
                    ]),
                  ]),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    padding: EdgeInsets.zero,
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
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 150,
              child: const Text('66666'),
            )
          ],
        ),
      ),
    );
  }
}

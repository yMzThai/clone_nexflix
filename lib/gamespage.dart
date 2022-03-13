



import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key, this.user}) : super(key: key);
  final Map<String, dynamic>? user;

  @override
  State<GamesPage> createState() => _GamesPage();
}

class _GamesPage extends State<GamesPage> {
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
    super.initState();
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
    return CustomScrollView(
        controller: _scrollController,
        slivers: [ SliverAppBar(
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
            )],
      );
  }
}
import 'package:clone_nexflix/constant.dart';
import 'package:clone_nexflix/favoritewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CusttomSlivereditor extends StatefulWidget {
  const CusttomSlivereditor({Key? key, this.user,this.lists})
      : super(key: key);
  final Map<String, dynamic>? user;
  final List<Widget>? lists;

  @override
  State<CusttomSlivereditor> createState() => _CusttomSlivereditorState();
}

class _CusttomSlivereditorState extends State<CusttomSlivereditor> {
  double _transparentBg = 0;
  bool _visible = false;
  double _scrollmoving = 0;
  double _tops = 0;

  late ScrollController _scrollController ,_scrollController2;

  @override
  void initState() {
    super.initState();
    _scrollController2  = ScrollController();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _transparentBg = _scrollController.offset <= 300
              ? _scrollController.offset / 1.5
              : 200;
        });
      });
    
  }

  @override
  void dispose() {
    _scrollController2.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _iconBar(icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Icon(
        icon,
        color: MyColors.text,
        size: 26,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Positioned.fill(
            top:-MediaQuery.of(context).padding.top,
              child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    setState(() {
                      if (_scrollController.position.userScrollDirection ==
                              ScrollDirection.forward &&
                          _tops != 0) {
                        _scrollmoving = _visible
                            ? _scrollController.offset + _tops
                            : _scrollmoving;
                        _visible = false;
                        _tops = (_scrollmoving - _scrollController.offset) < 0
                            ? (_scrollmoving - _scrollController.offset)
                            : 0;
                      } else if (_scrollController
                                  .position.userScrollDirection ==
                              ScrollDirection.reverse &&
                          _tops != -60) {
                        _scrollmoving = !_visible
                            ? _scrollController.offset
                            : _scrollmoving;
                        _visible = true;
                        _tops = (_scrollmoving - _scrollController.offset) > -60
                            ? (_scrollmoving - _scrollController.offset)
                            : -60;
                      }

                      print(_tops);
                      _scrollController2.jumpTo(_scrollController2.position.maxScrollExtent);
                    });
                    return true; //setState function
                  },
                  child: ListView(
                    controller: _scrollController,
                    children:widget.lists!,
                  ))),
          Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              height: _tops+116,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _scrollController2,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(_transparentBg.toInt(), 0, 0, 0),
                    ),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/Netflix_N_logo.png',
                              width: 24,
                            ),
                            Row(children: [
                              _iconBar(Icons.cast),
                              _iconBar(Icons.search),
                              _iconBar(Icons.tune),
                              roundImage(
                                  file: MyProFile().getImage(
                                      widget.user!["Profile"]!["key"],
                                      widget.user!["Profile"]!["index"]),
                                  size: 26),
                            ]),
                          ]),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 16, left: 30, bottom: 16),
                          child: Row(
                            children: const [
                              Text(
                                'More Option',
                                style: TextStyle( color:MyColors.text ,fontSize: 20),
                              ),
                              Icon(Icons.arrow_drop_down,color: MyColors.text,),
                            ],
                          ))
                    ])),
                ))
        ,Positioned(top: 0,
        left: 0,
        right: 0,
        height: MediaQuery.of(context).padding.top,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).padding.top, decoration: BoxDecoration(
                      color: Color.fromARGB(_transparentBg.toInt(), 0, 0, 0),
                    ),))]));
  }
}

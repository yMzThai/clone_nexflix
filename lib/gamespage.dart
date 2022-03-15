
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key, this.user}) : super(key: key);
  final Map<String, dynamic>? user;

  @override
  State<GamesPage> createState() => _GamesPage();
}

class _GamesPage extends State<GamesPage> {
  late ScrollController _scone, _stwo;
  double height = 100;
  double curMetrics = 0;

  @override
  void initState() {
    super.initState();
    _scone = ScrollController();
    _stwo = ScrollController();
  }

  @override
  void dispose() {
    _scone.dispose();
    _stwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        setState(() {
          if(_stwo.position.userScrollDirection == ScrollDirection.reverse){
            double h = height - notification.metrics.extentBefore + curMetrics;
            curMetrics = notification.metrics.extentBefore;
            height =  h > 50? h : 50;
          }


          _scone.jumpTo(_scone.position.maxScrollExtent);

        });
        //print(notification.metrics.extentAfter);
        //print(notification.metrics.extentBefore);
        print(_stwo.offset);
        print(_scone.offset);
        return true;
      },
      child: ListView(
          controller: _stwo,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: double.infinity,
              height: 1000,
              color: Colors.green,
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.pink,
            ),
          ]))),
        
        Positioned(
          top: MediaQuery.of(context).padding.top,
          left: 0,
          right: 0,
          height: height,
            child: ListView(
              controller: _scone,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.yellow,
            ),
          ],
        ))
      ]);
  }

  /*
  late ScrollController _scone, _sctwo;

  @override
   void initState() {
    super.initState();
    _scone = ScrollController();
    _sctwo = ScrollController();

    _sctwo.addListener(() {
        _scone.animateTo(_sctwo.offset, duration: const Duration(milliseconds: 10), curve: Curves.linear);

    });

   }

 


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(padding: const EdgeInsets.only(top:0),
        controller: _scone,
          children: [...List.generate(1000, (index) => Text(index.toString(),style: const TextStyle(color: MyColors.text),))],)),
          Positioned(
        top: 100,
        left: 0,
        right: 0,
        bottom: 500,
        child: ListView(padding: const EdgeInsets.only(top:0),
        controller: _sctwo,
          children: [...List.generate(100, (index) => Text(index.toString(),style: const TextStyle(color: MyColors.text),))],)),],
      
    );

    
  }*/
}

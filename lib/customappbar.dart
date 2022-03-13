import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class CusttomSlivereditor extends StatefulWidget {
  const CusttomSlivereditor({Key? key, this.user}) : super(key: key);
  final Map<String, dynamic>? user;

  @override
  State<CusttomSlivereditor> createState() => _CusttomSlivereditorState();
}

class _CusttomSlivereditorState extends State<CusttomSlivereditor> {
  double _transparentBg = 0;
  // double _visible = 1;
  double _scrollmoving = 0;
  Widget _text = Text('kker');

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          // _visible = _scrollController.offset > _scrollmoving ? 0 : 1;
          _scrollmoving = _scrollController.offset;
          _transparentBg = _scrollmoving <= 200 ? _scrollmoving / 4 : 50;
          _text = Text(_scrollController.offset.toString());
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: const ScrollPhysics(),
          controller: _scrollController,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 5000,
              child: const Text('aaa'),
            )
          ],
        ),
        Positioned(
          top: _scrollmoving,
          left: 0,
          right: 0,
          child: Container(
              padding: const EdgeInsets.all(9),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(_transparentBg.toInt(), 0, 0, 0)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/Netflix_N_logo.png',
                            width: 20,
                          ),
                          Row(children: [
                            const Icon(Icons.cast, color: MyColors.background),
                            const Icon(Icons.search,
                                color: MyColors.background),
                            const Icon(Icons.tune, color: MyColors.background),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                MyProFile().getImage(
                                    widget.user!["Profile"]!["key"],
                                    widget.user!["Profile"]!["index"]),
                                width: 24,
                              ),
                            )
                          ]),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 2000,
                    child: _text,
                  )
                ],
              )),
        )
      ],
    );
  }
}

// class CustomAppbars extends StatefulWidget {
//   const CustomAppbars({Key? key, this.user, this.trans, this.tops})
//       : super(key: key);
//   final Map<String, dynamic>? user;
//   final int? trans;
//   final double? tops;

//   @override
//   State<CustomAppbars> createState() => _CustomAppbarsState();
// }

// class _CustomAppbarsState extends State<CustomAppbars> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: ListView(
//       children: [
//         Positioned(
//           top: widget.tops,
//           left: 0,
//           right: 0,
//           child: Container(
//             decoration:
//                 BoxDecoration(color: Color.fromARGB(widget.trans!, 0, 0, 0)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset(
//                     'assets/images/Netflix_N_logo.png',
//                     width: 20,
//                   ),
//                   Row(children: [
//                     const Icon(Icons.cast, color: MyColors.background),
//                     const Icon(Icons.search, color: MyColors.background),
//                     const Icon(Icons.tune, color: MyColors.background),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.asset(
//                         MyProFile().getImage(widget.user!["Profile"]!["key"],
//                             widget.user!["Profile"]!["index"]),
//                         width: 24,
//                       ),
//                     )
//                   ]),
//                 ]),
//           ),
//         ),
//         Container(
//           height: 2000,
//           child: Text(widget.tops.toString()),
//         )
//       ],
//     ));
//   }
// }

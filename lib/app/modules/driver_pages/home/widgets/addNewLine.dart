

import 'package:flutter/material.dart';

class addNewLine extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<addNewLine> {
  String TapToExpandIt = 'Tap to Expand it';
  String Sentence = 'Widgets that have global keys reparent their subtrees when'
      ' they are moved from one location in the tree to another location in the'
      ' tree. In order to reparent its subtree, a widget must arrive at its new'
      ' location in the tree in the same animation frame in which it was removed'
      ' from its old location the tree.'
      ' Widgets that have global keys reparent their subtrees when they are moved'
      ' from one location in the tree to another location in the tree. In order'
      ' location the tree.';
  bool isExpanded = true;
  bool isExpanded2 = true;

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [

        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isExpanded2 = !isExpanded2;
            });
          },
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(
              horizontal: isExpanded2 ? 25 : 0,
              vertical: 20,
            ),
            padding: EdgeInsets.all(20),
            height: isExpanded2 ? 70 : 330,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1200),
            decoration: BoxDecoration(
              border: Border.all(),

              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(isExpanded2 ? 20 : 0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TapToExpandIt,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      isExpanded2
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: Colors.black,
                      size: 27,
                    ),
                  ],
                ),
                isExpanded2 ? SizedBox() : SizedBox(height: 20),
                AnimatedCrossFade(
                  firstChild: Text(
                    '',
                    style: TextStyle(
                      fontSize: 0,
                    ),
                  ),
                  secondChild: Text(
                    Sentence,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.7,
                    ),
                  ),
                  crossFadeState: isExpanded2
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1200),
                  reverseDuration: Duration.zero,
                  sizeCurve: Curves.fastLinearToSlowEaseIn,
                ),
              ],
            ),
          ),
        ),
      ],
        
      ),
    );
  }
}




























// import 'package:flutter/material.dart';
//
// class addNewLine extends StatefulWidget {
//   const addNewLine({Key? key}) : super(key: key);
//
//   @override
//   State<addNewLine> createState() => _addNewLineState();
// }
//
// class _addNewLineState extends State<addNewLine> {
//   @override
//   Widget build(BuildContext context) {
//     String TapToExpandIt = 'Tap to Expand it';
//     String Sentence = 'Widgets that have global keys reparent their subtrees when'
//         ' they are moved from one location in the tree to another location in the'
//         ' tree. In order to reparent its subtree, a widget must arrive at its new'
//         ' location in the tree in the same animation frame in which it was removed'
//         ' from its old location the tree.'
//         ' Widgets that have global keys reparent their subtrees when they are moved'
//         ' from one location in the tree to another location in the tree. In order'
//         ' to reparent its subtree, a widget must arrive at its new location in the'
//         ' tree in the same animation frame in which it was removed from its old'
//         ' location the tree.';
//     bool isExpanded = true;
//     bool isExpanded2 = true;
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;
//     return  InkWell(
//     highlightColor: Colors.transparent,
//     splashColor: Colors.transparent,
//     onTap: () {
//     setState(() {
//       isExpanded2 = !isExpanded2;
//     });
//     },
//     child: AnimatedContainer(
//     margin: EdgeInsets.symmetric(
//       horizontal: isExpanded2 ? 25 : 0,
//       vertical: 20,
//     ),
//     padding: EdgeInsets.all(20),
//     height: isExpanded2 ? 70 : 330,
//     curve: Curves.fastLinearToSlowEaseIn,
//     duration: Duration(milliseconds: 1200),
//     decoration: BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Color(0xffFF5050).withOpacity(0.5),
//           blurRadius: 20,
//           offset: Offset(5, 10),
//         ),
//       ],
//       color: Color(0xffFF5050),
//       borderRadius: BorderRadius.all(
//         Radius.circular(isExpanded2 ? 20 : 0),
//       ),
//     ),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               TapToExpandIt,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             Icon(
//               isExpanded2
//                   ? Icons.keyboard_arrow_down
//                   : Icons.keyboard_arrow_up,
//               color: Colors.white,
//               size: 27,
//             ),
//           ],
//         ),
//         isExpanded2 ? SizedBox() : SizedBox(height: 20),
//         AnimatedCrossFade(
//           firstChild: Text(
//             '',
//             style: TextStyle(
//               fontSize: 0,
//             ),
//           ),
//           secondChild: Text(
//             Sentence,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15.7,
//             ),
//           ),
//           crossFadeState: isExpanded2
//               ? CrossFadeState.showFirst
//               : CrossFadeState.showSecond,
//           duration: Duration(milliseconds: 1200),
//           reverseDuration: Duration.zero,
//           sizeCurve: Curves.fastLinearToSlowEaseIn,
//         ),
//       ],
//     ),
//     ),
//     );
//   }
// }
//
//
// // //مقاعد && شاغر
// // trailing:Row(
// // mainAxisAlignment: MainAxisAlignment.end,
// // children: [
// // Column(
// // children: [
// // Text('كلية علوم الحاسوب / صباحي')
// // ],
// // ),
// //
// // Column(
// // children: const[
// // Text('4',
// // style: TextStyle(
// // color: Palette.blueColor,fontWeight: FontWeight.bold,fontSize: 18
// // ),),
// // Text(' مقاعد   ',style: Styles.hintText,)
// // ],
// // ),
// //
// // Column(
// // children: const[
// // Text('2',
// // style: TextStyle(
// // color: Palette.blueColor,fontWeight: FontWeight.bold,fontSize: 18
// // ),),
// // Text('شاغر',style: Styles.hintText,)
// // ],
// // )
// // ],
// // ),
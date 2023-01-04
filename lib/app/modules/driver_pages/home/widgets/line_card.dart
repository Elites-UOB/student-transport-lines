import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/color_theme.dart';
import '../controller.dart';

class LineCard extends GetWidget<DriverHomeController> {
  String Sentence = '';

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => ListView.builder(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: controller.lines.value.length,
          itemBuilder: (context, index) => InkWell(
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (DismissDirection direction) {
                log('Dismissed with direction $direction');
                if (direction == DismissDirection.endToStart) {
                  // Your deletion logic goes here.
                }
              },
              confirmDismiss: (DismissDirection direction) async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Align(
                          alignment: Alignment.centerRight,
                          child: Text('هل أنت متأكد من الحذف؟')),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Yes'),
                        )
                      ],
                    );
                  },
                );
                log('Deletion confirmed: $confirmed');
                return confirmed;
              },
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.delete_forever, color: Colors.white),
                  ),
                ),
              ),

              //edit
              secondaryBackground: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ),

              //widget
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  controller.isExpanded.value = !controller.isExpanded.value;
                },
                child: AnimatedContainer(
                  margin: EdgeInsets.symmetric(
                    horizontal: controller.isExpanded.value ? 0 : 0,
                    vertical: 0,
                  ),
                  padding:
                      EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                  height: controller.isExpanded.value ? 80 : 330,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 1200),
                  decoration: BoxDecoration(
                      //color: Color(0xffFF5050),
                      borderRadius: BorderRadius.all(
                        Radius.circular(controller.isExpanded.value ? 20 : 0),
                      ),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'الحيانية',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    size: 18,
                                  ),
                                  Text(
                                    'جامعة البصرة، كرمة علي',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        color: Colors.white),
                                    child: const Text('40 أ.د.ع',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: Palette.pink),
                                        color: Palette.pink),
                                    child: const Text(
                                      'ممتلئ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.inpink),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Icon(
                            controller.isExpanded.value
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Colors.grey,
                            size: 27,
                          ),
                        ],
                      ),
                      controller.isExpanded.value
                          ? SizedBox()
                          : SizedBox(height: 20),
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
                            color: Colors.white,
                            fontSize: 15.7,
                          ),
                        ),
                        crossFadeState: controller.isExpanded.value
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
            ),
          ),
        ),
      ),
    );
  }
}

// _confirmDeletion(BuildContext context) {
// }
//



























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
//     bool isExpanded = true;
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;
//     return  InkWell(
//     highlightColor: Colors.transparent,
//     splashColor: Colors.transparent,
//     onTap: () {
//     setState(() {
//       isExpanded = !isExpanded;
//     });
//     },
//     child: AnimatedContainer(
//     margin: EdgeInsets.symmetric(
//       horizontal: isExpanded ? 25 : 0,
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
// import 'package:flutter/material.dart';
// import 'package:madhani_one/common_ui/button/PrimaryButtonTextOnly.dart';
// import 'package:madhani_one/common_ui/common_colors.dart';
// import 'package:madhani_one/common_ui/common_typography.dart';

// class CommonWelcomingDialog extends StatelessWidget {
//   const CommonWelcomingDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 28),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//         color: Colors.white,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Align(
//               alignment: Alignment.centerLeft,
//               child: GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Icon(Icons.close))),
//           const SizedBox(height: 20),
//           Image.asset(
//             "assets/images/illustration_welcoming.png",
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 35),
//             child: Text(
//                 "Start Growth and learning with \n Madhani Online Education",
//                 textAlign: TextAlign.center,
//                 style: CommonTypography.textInter15),
//           ),
//           const SizedBox(
//             height: 51,
//           ),
//           PrimaryButtonTextOnly(
//             textColor: Colors.white,
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             label: "Start learning",
//             backgroundColor: CommonColors.blueC9,
//             isActive: true,
//           ),
//         ],
//       ),
//     );
//   }
// }

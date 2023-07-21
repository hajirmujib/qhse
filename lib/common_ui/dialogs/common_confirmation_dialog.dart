// import 'package:madhani_one/common_ui/button/OutlineButtonTextOnly.dart';
// import 'package:madhani_one/common_ui/button/PrimaryButtonTextOnly.dart';
// import 'package:madhani_one/common_ui/common_colors.dart';
// import 'package:madhani_one/common_ui/common_typography.dart';
// import 'package:flutter/material.dart';

// class CommonConfirmationDialog extends StatelessWidget {
//   final String title;
//   final String description;
//   final VoidCallback? onLeftBtnClick;
//   final VoidCallback? onRightBtnClick;
//   final String btnTextLeft;
//   final String btnTextRight;

//   const CommonConfirmationDialog({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.onLeftBtnClick,
//     required this.onRightBtnClick,
//     required this.btnTextLeft,
//     required this.btnTextRight,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       insetPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//       alignment: Alignment.bottomCenter,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
//             child: Text(
//               title,
//               style: CommonTypography.textH7,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 18, left: 24, right: 24),
//             child: description.isNotEmpty
//                 ? Text(
//                     description,
//                     textAlign: TextAlign.center,
//                     style: CommonTypography.textBody,
//                   )
//                 : Container(),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: description.isNotEmpty ? 28 : 18,
//               left: 24,
//               right: 24,
//               bottom: 18,
//             ),
//             child:  Row(
//               children: [
//                 Expanded(
//                   child: OutlineButtonText(
//                     horizontalPadding: 5,
//                     verticalPadding: 5,
//                     textColor: CommonColors.blueC9,
//                     borderColor: CommonColors.blueC9,
//                     fontSize: 18,
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     label: btnTextLeft,
//                     backgroundColor: Colors.white,
//                     isActive: true,
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: PrimaryButtonTextOnly(
//                     textColor: Colors.white,
//                     horizontalPadding: 5,
//                     verticalPadding: 5,
//                     onTap: () {
//                       Navigator.pop(context);
//                       onRightBtnClick?.call();
//                     },
//                     fontSize: 18,
//                     label: btnTextRight,
//                     backgroundColor: CommonColors.blueC9,
//                     isActive: true,
//                   ),
//                 ),
//               ],
//             )
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:madhani_one/core/utils/file_util.dart';

// class MyBottomSheet extends StatelessWidget {
//   final picker = ImagePicker();
//   final Function(String, String) onImageSelected;

//   MyBottomSheet({super.key, required this.onImageSelected});

//   Future<void> _getImageFromCamera(BuildContext context) async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.camera, imageQuality: 10);

//     if (pickedFile != null) {
//       var newCompress = await compressFileWithTargetSize(pickedFile, 512);
//       onImageSelected(newCompress.path, newCompress.name);
//     } else {
//       print('No image selected.');
//     }

//   }

//   Future<void> _getImageFromGallery(BuildContext context) async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);


//     if (pickedFile != null) {
//       var newCompress = await compressFileWithTargetSize(pickedFile, 512);
//       onImageSelected(newCompress.path, newCompress.name);
//     } else {
//       print('No image selected.');
//     }

//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: [
//         ListTile(
//           leading: const Icon(Icons.camera_alt),
//           title: const Text('Take a photo'),
//           onTap: () {
//             _getImageFromCamera(context);
//             Navigator.pop(context);
//           },
//         ),
//         ListTile(
//           leading: const Icon(Icons.photo_library),
//           title: const Text('Choose from gallery'),
//           onTap: () {
//             _getImageFromGallery(context);
//           },
//         ),
//       ],
//     );
//   }
// }

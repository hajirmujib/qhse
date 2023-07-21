// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:madhani_one/core/utils/file_util.dart';
// import 'package:madhani_one/src/fgdp/domain/models/file_dto.dart';

// class CommonPicturePickerDialog extends StatelessWidget {
//   final picker = ImagePicker();
//   final Function(List<FileDto>) onImageSelected;

//   CommonPicturePickerDialog({super.key, required this.onImageSelected});

//   Future<void> _getImageFromCamera(BuildContext context) async {
//     final pickedFile =
//     await picker.pickImage(source: ImageSource.camera, imageQuality: 60);
//     if (pickedFile != null) {
//       var newCompress = await compressFileWithTargetSize(pickedFile, 5000);
//       onImageSelected([FileDto(path: newCompress.path, fileName: newCompress.name)]);
//     } else {
//       print('No image selected.');
//     }

//     Navigator.pop(context);
//   }

//   Future<void> _getImageFromGallery(BuildContext context) async {
//     final List<XFile> pickedFiles = await picker.pickMultiImage(
//       maxWidth: 800, // Set the maximum width of the selected images
//       imageQuality: 60, // Set the image quality
//     );

//     if (pickedFiles.isNotEmpty) {
//       List<FileDto> fileDtos = [];

//       for (XFile pickedFile in pickedFiles) {
//         final String path = pickedFile.path;
//         final String fileName = pickedFile.name;

//         FileDto fileDto = FileDto(path: path, fileName: fileName);
//         fileDtos.add(fileDto);
//       }

//       // Pass the selected fileDtos to the parent page
//       onImageSelected(fileDtos);
//     } else {
//       print('No images selected.');
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

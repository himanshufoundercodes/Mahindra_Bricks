// class ImagePickerScreen extends StatefulWidget {
//   const ImagePickerScreen({super.key});
//
//   @override
//   State<ImagePickerScreen> createState() => _ImagePickerScreenState();
// }
//
// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//
//   File? selectedImage;
//
//   final ImagePicker picker = ImagePicker();
//
//   // Camera ya Gallery se image select karna
//   Future<void> pickImage(ImageSource source) async {
//
//     final XFile? image = await picker.pickImage(
//       source: source,
//     );
//
//     if (image != null) {
//       setState(() {
//         selectedImage = File(image.path);
//       });
//     }
//   }
//
//   // Camera aur Gallery ka option
//   void showImagePicker() {
//
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//
//         return Container(
//           height: 160,
//           padding: const EdgeInsets.all(20),
//
//           child: Column(
//             children: [
//
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text("Camera"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pickImage(ImageSource.camera);
//                 },
//               ),
//
//               ListTile(
//                 leading: const Icon(Icons.photo),
//                 title: const Text("Gallery"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   pickImage(ImageSource.gallery);
//                 },
//               ),
//
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Image Picker"),
//       ),
//
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             // Selected Image
//             Container(
//               height: 200,
//               width: 200,
//
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//
//               child: selectedImage != null
//                   ? ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.file(
//                   selectedImage!,
//                   fit: BoxFit.cover,
//                 ),
//               )
//                   : const Icon(
//                 Icons.image,
//                 size: 80,
//                 color: Colors.grey,
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             // Pick Image Button
//             ElevatedButton(
//               onPressed: showImagePicker,
//               child: const Text("Select Image"),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
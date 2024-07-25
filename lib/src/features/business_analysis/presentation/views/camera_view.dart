// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class CameraView extends StatefulWidget {
//   const CameraView({Key? key}) : super(key: key);

//   @override
//   _CameraViewState createState() => _CameraViewState();
// }

// class _CameraViewState extends State<CameraView> {
//   CameraController? controller;
//   List<CameraDescription>? cameras;

//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }

//   Future<void> initializeCamera() async {
//     cameras = await availableCameras();
//     controller = CameraController(cameras![0], ResolutionPreset.high);
//     await controller!.initialize();
//     if (!mounted) return;
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (controller == null || !controller!.value.isInitialized) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return Scaffold(
//       appBar: AppBar(title: Text('Camera Preview')),
//       body: Stack(
//         children: [
//           CameraPreview(controller!),
//           Center(
//             child: Container(
//               width: 250,
//               height: 250,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.white,
//                   width: 2.0,
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: FloatingActionButton(
//                 child: Icon(Icons.camera),
//                 onPressed: () async {
//                   try {
//                     final image = await controller!.takePicture();
//                     // Process the image or navigate to another screen
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

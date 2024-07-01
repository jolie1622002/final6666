import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Dialog.dart';

class AddHistoryScreen extends StatefulWidget {
  @override
  _AddHistoryScreenState createState() => _AddHistoryScreenState();
}

class _AddHistoryScreenState extends State<AddHistoryScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];
  List<bool> _selectedImages = [];

  Future<void> _pickImages() async {
    try {
      final pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        setState(() {
          _images.addAll(
            pickedFiles.map((pickedFile) => File(pickedFile.path)).toList(),
          );
          _selectedImages = List<bool>.generate(_images.length, (_) => false);
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  void _deleteSelectedImages() {
    setState(() {
      _images = [
        for (int i = 0; i < _images.length; i++)
          if (!_selectedImages[i]) _images[i]
      ];
      _selectedImages = List<bool>.filled(_images.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          DialogUtils.closeLoading(context);
          DialogUtils.showMessage(context,
            message: "Saved Successfully",
            title: "Success",
            posActionName: 'Ok', posAction: () {
              // DialogUtils.closeLoading(context);
            },
          );
        },
        child: Text('Save Selected Images'),
      ),
      appBar: AppBar(
        title: Text('Upload Images'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteSelectedImages,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickImages,
              child: Text('Pick Images'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _images.isEmpty
                  ? Text('No images selected.')
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImages[index] = !_selectedImages[index];
                            });
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.file(
                                _images[index],
                                fit: BoxFit.cover,
                              ),
                              if (_selectedImages[index])
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../Dialog.dart';

// class AddHistoryScreen extends StatefulWidget {
//   @override
//   _AddHistoryScreenState createState() => _AddHistoryScreenState();
// }

// class _AddHistoryScreenState extends State<AddHistoryScreen> {
//   final ImagePicker _picker = ImagePicker();
//   List<File> _images = [];
//   List<bool> _selectedImages = [];

//   Future<void> _pickImages() async {
//     final pickedFiles = await _picker.pickMultiImage();

//     if (pickedFiles != null && pickedFiles.isNotEmpty) {
//       setState(() {
//         _images.addAll(
//             pickedFiles.map((pickedFile) => File(pickedFile.path)).toList());
//         _selectedImages = List<bool>.generate(_images.length, (_) => false);
//       });
//     }
//   }

//   void _deleteSelectedImages() {
//     setState(() {
//       _images = [
//         for (int i = 0; i < _images.length; i++)
//           if (!_selectedImages[i]) _images[i]
//       ];
//       _selectedImages = List<bool>.filled(_images.length, false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: ElevatedButton(
//         onPressed: () {
//           DialogUtils.closeLoading(context);
//           DialogUtils.showMessage(context,
//               message: "Saved Succuessfully",
//               title: "Success",
//               posActionName: 'Ok', posAction: () {
//             // DialogUtils.closeLoading(context);
//           });
//         },
//         child: Text('Save Selected Images'),
//       ),
//       appBar: AppBar(
//         title: Text('Upload Images'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: _deleteSelectedImages,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _pickImages,
//               child: Text('Pick Images'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: _images.isEmpty
//                   ? Text('No images selected.')
//                   : GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 4.0,
//                         mainAxisSpacing: 4.0,
//                       ),
//                       itemCount: _images.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _selectedImages[index] = !_selectedImages[index];
//                             });
//                           },
//                           child: Stack(
//                             fit: StackFit.expand,
//                             children: [
//                               Image.file(
//                                 _images[index],
//                                 fit: BoxFit.cover,
//                               ),
//                               if (_selectedImages[index])
//                                 Container(
//                                   color: Colors.black.withOpacity(0.5),
//                                   child: Icon(
//                                     Icons.check,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
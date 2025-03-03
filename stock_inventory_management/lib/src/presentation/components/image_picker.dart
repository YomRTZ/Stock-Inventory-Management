import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  // variables used for store the selected image with file path
  File? _savedImage;
  String? _savedImagePath;
  Future<void> _pickAndSaveImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    // Get the app's document directory
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String fileName = pickedFile.name;
    final String localPath = '${appDir.path}/$fileName';

    // Copy the image to the local directory
    final File localImage = await File(pickedFile.path).copy(localPath);

    setState(() {
      _savedImage = localImage;
      _savedImagePath = localPath;
    });

    // Print the saved image path
    print("Saved Image Path: $_savedImagePath");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker & Save")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _savedImage != null ? Image.file(_savedImage!, height: 200) : const Text("No image selected"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAndSaveImage,
              child: const Text("Pick & Save Image"),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paylas/provider/all_providers.dart';

class PhotoPicker {
  static Future<void> showPhotoPicker(
      {required BuildContext context,
      required WidgetRef ref,
      required Function() onGalleryPressed,
      required Function() onCameraPressed}) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: onGalleryPressed,
            child: const Text('Photo Gallery'),
          ),
          CupertinoActionSheetAction(
            onPressed: onCameraPressed,
            child: const Text('Camera'),
          ),
        ],
      ),
    );
  }

  static Future<void> getImage(
      {required ImageSource source, required WidgetRef ref}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
    );
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      //resmi FİLE olarak elimizde tutarız
      ref.read(currentImageProvider.notifier).state = image;
    }
  }
}

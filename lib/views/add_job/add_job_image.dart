import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/views/add_job/photo_picker.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class AddJobImage extends ConsumerWidget {
  const AddJobImage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String imgUrl = ref.watch(currentImageProvider).path;
    return InkWell(
      onTap: () async {
        await PhotoPicker.showPhotoPicker(
            context: context,
            ref: ref,
            onCameraPressed: () async {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              await PhotoPicker.getImage(source: ImageSource.camera, ref: ref);
            },
            onGalleryPressed: () async {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              await PhotoPicker.getImage(source: ImageSource.gallery, ref: ref);
            });
      },
      borderRadius: BorderRadius.circular(80),
      splashColor: ColorUiHelper.mainTitleBlue,
      child: Container(
        height: 180,
        width: 180,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorUiHelper.mainTitleBlue,
          image: DecorationImage(
              image: (imgUrl == "")
                  ? AssetImage("assets/icon/add-image.png")
                  : (imgUrl.contains("https") == true
                      ? NetworkImage(imgUrl) as ImageProvider
                      : FileImage(File(imgUrl))),
              fit: imgUrl == "" ? null : BoxFit.fill),
          boxShadow: [
            BoxShadow(
                color: ColorUiHelper.mainTitleYellow.withOpacity(1),
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: const Offset(0, 0)),
          ],
        ),
        child: (imgUrl == "assets/icons/addCarIcon.png")
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    "Resim Ekle",
                    style: TextStyleHelper.addImageButtonTextStyle,
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}


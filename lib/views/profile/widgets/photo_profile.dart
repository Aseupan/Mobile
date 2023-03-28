import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/controller/profile/edit_profile_controller.dart';
import 'package:mobile/services/api/post_api_service.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/utils/image_picker.dart';
import 'package:mobile/widgets/text_styles.dart';

class AddPhotoProfile extends StatefulWidget {
  const AddPhotoProfile({super.key});

  @override
  State<AddPhotoProfile> createState() => _AddPhotoProfileState();
}

class _AddPhotoProfileState extends State<AddPhotoProfile> {
  File? _imageFile;

  EditProfileController controller = EditProfileController.i;

  Widget PhotoProfile() {
    if (_imageFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.file(
          _imageFile!,
          width: 115,
          height: 115,
          fit: BoxFit.cover,
        ),
      );
    } else if (controller.profile_picture.value == "") {
      return Image.asset(
        "assets/images/dummy_profile.png",
        width: 115,
        height: 115,
        fit: BoxFit.cover,
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          controller.profile_picture.value,
          width: 115,
          height: 115,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: PhotoProfile(),
        ),
        SizedBox(height: 12),
        Center(
          child: InkWell(
            onTap: () async {
              var pickedImage = await pickImage(ImageSource.gallery);
              if (pickedImage != null) {
                setState(() {
                  _imageFile = pickedImage;
                });
                PostApiService.updatePhotoProfile(_imageFile!);
              }
            },
            child: Text(
              'Set photo profile',
              style: body6TextStyle(color: ColorConstants.slate[400]),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

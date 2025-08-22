import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  late final ProfileProvider _profileProvider;

  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    controller.text = _profileProvider.name;
    controller2.text = _profileProvider.surname;
  }

  String? path;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          CustomAppBar(text: "back", hasBack: true, child: ProfileButtons()),
          SizedBox(height: 30.h),
          Text("Edit Profile", style: AppTextStyles.cns32),
          SizedBox(height: 7.h),
          Opacity(
            opacity: 0.5,
            child: Text(
              "Replace your first and last\nname if necessary",
              style: AppTextStyles.cn14_400,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.h),
          AvatarCard(canEdit: true, profilePhoto: path, onTap: pickImage),
          SizedBox(height: 25.h),
          CustomTextField(title: "Name", controller: controller),
          SizedBox(height: 25.h),
          CustomTextField(title: "Surname", controller: controller2),
          Spacer(),
          CustomButton2(
            text: "Replace",
            width: 325.w,
            height: 45.h,
            onTap: () {
              final name = controller.text.trim();
              final surname = controller2.text.trim();
              if (name.isEmpty || surname.isEmpty) return;

              _profileProvider.updateProfile(name, surname, path);
              context.pop();
            },
          ),
          SizedBox(height: 45.h),
        ],
      ),
    );
  }

  void pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      path = pickedFile.path;
      setState(() {});
    }
  }
}

import 'dart:io';

import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/screens/add_clinic_data.dart';
import 'package:final_graduation_project/features/doctor/send_licence/presentation/manager/add_practice_licence_cubit.dart';
import 'package:final_graduation_project/features/doctor/send_licence/presentation/widgets/attach_photo.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostLicenceScreen extends StatefulWidget {
  const PostLicenceScreen({Key? key}) : super(key: key);

  @override
  State<PostLicenceScreen> createState() => _PostLicenceScreenState();
}

class _PostLicenceScreenState extends State<PostLicenceScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? _image;

  final pickedFile = ImagePicker();

  uploadImage() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  final cubit = AddPracticeLicenceCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<AddPracticeLicenceCubit, AddPracticeLicenceState>(
        listener: (context, state) {
          if(state is AddPracticeLicenceSucsess){
            push(context, AddClinicData());
          }
          if(state is AddPracticeLicenceFailure){
            showError(state.message);
          }
          
        },
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Scaffold(
              body: LayoutBuilder(
                builder: (context, constrains) =>
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constrains.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20.sp, horizontal: 15.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Clinic licence",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.sp),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AttachPhoto(
                                  onTap: () {
                                    uploadImage();
                                  },
                                  widget: _image == null
                                      ? const Icon(Icons.add_photo_alternate)
                                      : Container(
                                      margin: EdgeInsets.all(13.sp),
                                      child: Image.file(
                                        _image!,
                                        width: 5.sp,
                                        height: 5.sp,
                                      )),
                                  hint: _image == null
                                      ? S().attachPhoto
                                      : S().changePhoto,
                                ),
                                const Spacer(),
                                AppButton(
                                  onPressed: () {

                                    if (_image != null) {
                                      cubit.addPracticeLicence(
                                          image: _image!.path.toString(),
                                          id: MyShared.getString(key: MySharedKeys.id)
                                      );
                                    }
                                  },
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 0.sp),
                                  padding: EdgeInsets.all(17.sp),
                                  label: "Send",
                                  bgColor: AppColors.primary,
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/manager/doctor_data_images_cubit.dart';
import 'package:final_graduation_project/features/doctor/send_licence/presentation/screens/congratulation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddClinicImages extends StatefulWidget {
  const AddClinicImages({Key? key}) : super(key: key);

  @override
  State<AddClinicImages> createState() => _AddClinicImagesState();
}

class _AddClinicImagesState extends State<AddClinicImages> {
  final ImagePicker imagePicker = ImagePicker();

  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;
  File? _image5;

  final pickedFile1 = ImagePicker();
  final pickedFile2 = ImagePicker();
  final pickedFile3 = ImagePicker();
  final pickedFile4 = ImagePicker();
  final pickedFile5 = ImagePicker();

  uploadImage1() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile1.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image1 = File(pickedImage.path);
      });
    }
  }

  uploadImage2() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile2.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image2 = File(pickedImage.path);
      });
    }
  }

  uploadImage3() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile3.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image3 = File(pickedImage.path);
      });
    }
  }

  uploadImage4() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile4.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image4 = File(pickedImage.path);
      });
    }
  }

  uploadImage5() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile5.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image5 = File(pickedImage.path);
      });
    }
  }



  final cubit = DoctorDataImagesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<DoctorDataImagesCubit, DoctorDataImagesState>(
        listener: (context, state) {
          if(state is DoctorImagesSuccess){
            hideLoading();
            push(context, const RegisterationProcessScreen());
          }
          if(state is DoctorImagesFailure){
            hideLoading();
            showError(state.message);
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: LayoutBuilder(
              builder: (context, constrains) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constrains.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 25.sp, horizontal: 15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Clinic Images",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50.sp,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Container(
                                          color: Colors.grey[200],
                                          child: InkWell(
                                            onTap: uploadImage1,
                                            child: _image1 == null
                                                ? const Icon(
                                                    Icons.linked_camera,
                                                    color: AppColors.primary,
                                                  )
                                                : Image.file(
                                                    _image1!,
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ),
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50.sp,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Container(
                                          color: Colors.grey[200],
                                          child: InkWell(
                                            onTap: uploadImage2,
                                            child: _image2 == null
                                                ? const Icon(
                                                    Icons.linked_camera,
                                                    color: AppColors.primary,
                                                  )
                                                : Image.file(
                                                    _image2!,
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 50.sp,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Container(
                                          color: Colors.grey[200],
                                          child: InkWell(
                                            onTap: uploadImage3,
                                            child: _image3 == null
                                                ? const Icon(
                                                    Icons.linked_camera,
                                                    color: AppColors.primary,
                                                  )
                                                : Image.file(
                                                    _image3!,
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50.sp,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Container(
                                          color: Colors.grey[200],
                                          child: InkWell(
                                            onTap: uploadImage4,
                                            child: _image4 == null
                                                ? const Icon(
                                                    Icons.linked_camera,
                                                    color: AppColors.primary,
                                                  )
                                                : Image.file(
                                                    _image4!,
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ),
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 50.sp,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      child: Container(
                                          color: Colors.grey[200],
                                          child: InkWell(
                                            onTap: uploadImage5,
                                            child: _image5 == null
                                                ? const Icon(
                                                    Icons.linked_camera,
                                                    color: AppColors.primary,
                                                  )
                                                : Image.file(
                                                    _image5!,
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppButton(
                            onPressed: () {
                              if(_image1 == null || _image2 == null ||  _image3 == null|| _image4 == null|| _image5 == null){
                                showError("Enter 5 images for your clinic");
                              } else{
                                cubit.addPracticeLicence(
                                    image: _image1!.path,
                                    image2: _image2!.path,
                                    image3: _image3!.path,
                                    image4: _image4!.path,
                                    image5: _image5!.path,
                                    id: MyShared.getString(key: MySharedKeys.id));
                              }

                            },
                            margin: EdgeInsets.symmetric(horizontal: 0.sp),
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
    );
  }
}

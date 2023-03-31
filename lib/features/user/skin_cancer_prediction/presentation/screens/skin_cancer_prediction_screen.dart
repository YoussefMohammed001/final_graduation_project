import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/spinner_text_form_field.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
import 'package:final_graduation_project/features/user/skin_cancer_prediction/presentation/widgets/skin_cancer_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SkinCancerScreen extends StatefulWidget {
  SkinCancerScreen({Key? key}) : super(key: key);

  @override
  State<SkinCancerScreen> createState() => _SkinCancerScreenState();
}

class _SkinCancerScreenState extends State<SkinCancerScreen> {
  SingleValueDropDownController male = SingleValueDropDownController();

  File? _image;
  final pickedFile = ImagePicker();

  uploadImage() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(
              title: 'Skin Cancer',
            ),
            Expanded(
              child: LayoutBuilder(
                  builder: (context, constrains) => SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constrains.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Container(
                              margin: EdgeInsets.all(17.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    "Choose the gender",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SpinnerTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "enter your gender";
                                      }
                                    },
                                    textColor: Colors.black,
                                    hint: 'male',
                                    controller: male,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    enabled: false,
                                    dropDownList: const [
                                      DropDownValueModel(
                                          name: "Male", value: "Male"),
                                      DropDownValueModel(
                                          name: "Female", value: "Female"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "Attach the photo of skin cancer",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SkinCancerTextFormField(
                                    onTap: uploadImage,
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
                                        ? 'Attach the photo'
                                        : 'Change the photo',
                                  ),
                                  const Spacer(),
                                  AppButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        push(
                                            context,
                                            const PredictionResultScreen(
                                              appBarTitle:
                                                  'Skin Cancer prediction result',
                                              result: 'Benign',
                                              description:
                                                  'description description  description description description description description description description description description description description description  description description description description description description',
                                            ));
                                        print(male.dropDownValue!.name
                                            .toString());
                                      }
                                    },
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 17.sp),
                                    padding: EdgeInsets.all(17.sp),
                                    label: "Predict",
                                    bgColor: AppColors.primary,
                                    borderRadius: BorderRadius.circular(15.sp),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

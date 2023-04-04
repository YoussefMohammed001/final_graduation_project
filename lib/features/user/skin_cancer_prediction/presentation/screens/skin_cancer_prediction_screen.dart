import 'dart:io';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/spinner_text_form_field.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
import 'package:final_graduation_project/features/user/skin_cancer_prediction/presentation/widgets/skin_cancer_text_form_field.dart';
import 'package:final_graduation_project/generated/l10n.dart';
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

    var pickedImage = await pickedFile.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);

      });
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
             CustomAppBar(
              title: S().skinCancer,
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
                                    S().chooseTheGender,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  DropDownTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "enter your gender";
                                      }
                                    },
                                    textColor: Colors.black,
                                    hint: S().maleHint,
                                    controller: male,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    enabled: false,
                                    dropDownList:  [
                                      DropDownValueModel(
                                          name: S().male, value: S().male),
                                      DropDownValueModel(
                                          name: S().female, value: S().female),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    S().attachPhotoOfTheSkin,
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
                                        ? S().attachPhoto
                                        : S().changePhoto,
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
                                    label: S().predict,
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

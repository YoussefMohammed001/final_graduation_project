import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 20.sp),
        child: ListView(
          children: [
            SizedBox(
              width: 3.h,
            ),

            SizedBox(
              height: 2.h,
            ),

            MyTextFormField(
                hint: "Youssef Mohamed",
                icon: Icons.person_outline_outlined,
                controller: nameController,
                isPassword: false,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                title: "Name"),
            MyTextFormField(
                hint: MyShared.getString(key: MySharedKeys.apiToken),
                icon: Icons.person_outline_outlined,
                controller: emailController,
                isPassword: false,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                title: "Email"),
            MyTextFormField(
              hint: "@1223@12",
              icon: Icons.lock_outline_rounded,
              controller: passwordController,
              isPassword: true,
              textInputAction: TextInputAction.next,
              title: "Password",
              textInputType: TextInputType.text,
            ),

            MyTextFormField(
                hint: "Cairo Egypt",
                icon: Icons.location_on_outlined,
                controller: cityController,
                isPassword: false,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                title: "City"),
            MyTextFormField(
                hint: "El Shourok",
                icon: Icons.location_on_outlined,
                controller: addressController,
                isPassword: false,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                title: "Address"),
            AppButton(
              onPressed: () {


              },
              label: "Logout",
              margin: EdgeInsets.all(10.sp),
              borderRadius: BorderRadius.circular(13.sp),
              bgColor: AppColors.primary,
            ),  AppButton(
              onPressed: () {
              },
              label: "Delete Account",
              margin: EdgeInsets.all(10.sp),
              borderRadius: BorderRadius.circular(13.sp),
              bgColor: AppColors.red,
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}

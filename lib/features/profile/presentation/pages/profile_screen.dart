import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/profile/presentation/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocListener<ProfileCubit, ProfileState>(

      listener: (context, state) {
        if (state is ProfileLoading) {
          showLoading();
        }
        if (state is ProfileLogoutSucsess) {
          pushReplacement(context, BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ));
          showSuccess(state.sucsessMessage);
        }
        if (state is ProfileLogoutFailure) {
          showError(state.failureMessage);
        }
      },
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 20.sp),
        ),
      ),
    );
  }
}

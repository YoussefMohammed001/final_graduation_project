import 'package:final_graduation_project/core/cubits/language/language_cubit.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ChangeLangItem extends StatefulWidget {
  const ChangeLangItem({Key? key}) : super(key: key);

  @override
  State<ChangeLangItem> createState() => _ChangeLangItemState();
}

class _ChangeLangItemState extends State<ChangeLangItem> {
  @override
  Widget build(BuildContext context) {
               return Container(
      height: 27.h,
      margin: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 5.h,),

          Text("Change Language",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
          SizedBox(height: 3.h,),


          AppButton(
            margin: EdgeInsets.all(8.sp),
            onPressed: (){
              MyShared.getCurrentLanguage() == 'en' ?
              this.context.read<LanguageCubit>().changeLanguageToAr()
              :
              this.context.read<LanguageCubit>().changeLanguageToEn();
            }, label:MyShared.getCurrentLanguage() == 'en' ?  "Arabic" :"English",bgColor: AppColors.primary,),
          SizedBox(height: 3.h,),
          Center(child: InkWell(
              onTap: (){
                pop(context);
              },
              child: const Text("Back")))

        ],
      ),
    );

  }
}

import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  MyTextFormField({
    Key? key,
    required this.hint,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black, required this.icon, required this.controller, required this.isPassword, this.validators, required this.textInputAction, required this.textInputType, required this.title,
  }) : super(key: key);
  final Color textColor;
  final String hint;


  final bool isPassword;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String title;
  final IconData icon;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(20.sp),
      child: Column(
        children: [
          Row(
            children: [
              Icon(widget.icon,color: AppColors.primary,size: 17.sp,),
              SizedBox(width: 2.w,),
              Text(widget.title,style: TextStyle(fontSize: 15.sp,color: AppColors.primary),)
            ],
          ),
          TextFormField(
            validator: widget.validators,
            obscureText: obscureText,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(

            suffixIcon: Visibility(
            visible: widget.isPassword,
    child: InkWell(
    onTap: () {
    setState(() {
    obscureText = !obscureText;
    });
    },
    child: Icon(
    obscureText ? Icons.visibility_off : Icons.visibility,
    color: AppColors.primary,
    ),
    ),
    ),
              enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                borderSide: BorderSide(
                    width: 3, color: Colors.grey.shade200),
              ),
              hintText: widget.hint,
            ),
          ),
        ],
      ),
    );
  }
}

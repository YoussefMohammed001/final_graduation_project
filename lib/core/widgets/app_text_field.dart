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
    this.isSearch = false,
    this.textColor = Colors.black,
    required this.controller,
    required this.isPassword,
    this.validators,
    required this.textInputAction,
    required this.textInputType,
    this.enabled =true,
  }) : super(key: key);
  final Color textColor;
  final String hint;
  final bool isPassword;
  final bool isSearch;
  final bool? enabled;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
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
      margin: widget.margin,
      child: Column(
        children: [
          TextFormField(
            enabled: widget.enabled,
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
                    color: Colors.grey,
                  ),
                ),
              ),
              hintText: widget.hint,


              hintStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey
              ),
              focusColor: Colors.grey.shade200,
              fillColor: Colors.grey.shade200,
              filled: true,
              disabledBorder:OutlineInputBorder(

                borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ) ,
              focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ),


                border: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ),

            ),


          ),
        ],
      ),
    );
  }
}

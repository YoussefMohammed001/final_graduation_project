import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentTextFormField extends StatefulWidget {
  const AppointmentTextFormField({Key? key, required this.hint, required this.title,  this.enabled = false, required this.hintDisabled, required this.hintEnabled, this.validators, required this.controller, required this.textInputAction, required this.textInputType}) : super(key: key);
final String hint;
final String title;
final bool enabled;
final String  hintDisabled;
final String  hintEnabled;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  State<AppointmentTextFormField> createState() => _AppointmentTextFormFieldState();
}

class _AppointmentTextFormFieldState extends State<AppointmentTextFormField> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 1.h,),
        TextFormField(
          validator: widget.validators,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          enabled: widget.enabled,

          decoration: InputDecoration(
            focusColor: Colors.grey.shade200,
            fillColor: Colors.grey.shade200,
            filled: widget.enabled == true ? true : false,

            hintText: widget.enabled == true ?  widget.hintEnabled : widget.hintDisabled ,
            disabledBorder:OutlineInputBorder(

              borderSide:  BorderSide(color: Colors.white, width: 2.0),
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
          // decoration: InputDecoration(

          //   disabledBorder: const UnderlineInputBorder(
          //     borderSide: BorderSide(
          //       width: 1, color: Colors.white,),
          //   ) ,
          //   enabledBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(
          //       width: 1, color: Colors.grey.shade300,),
          //   ),
          // ),
        ),
      ],
    );
  }
}

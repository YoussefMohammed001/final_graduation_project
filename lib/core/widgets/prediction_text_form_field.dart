import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PredictionTextFormField extends StatefulWidget {
   PredictionTextFormField({Key? key, required this.hint, this.validators, required this.controller, required this.textInputAction,  required this.suffixText}) : super(key: key);
  final String hint;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final String suffixText;
  @override
  State<PredictionTextFormField> createState() => _PredictionTextFormFieldState();
}

class _PredictionTextFormFieldState extends State<PredictionTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        children: [
          TextFormField(

            validator: widget.validators,
            controller: widget.controller,
            keyboardType: TextInputType.number,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(

              suffixIcon: Container(
                margin: EdgeInsets.all(15.sp),
                child: Text(
                  widget.suffixText,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              hintText: widget.hint,
              focusColor: Colors.grey.shade200,
              fillColor: Colors.grey.shade200,
              filled: true,
              hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey
              ),

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

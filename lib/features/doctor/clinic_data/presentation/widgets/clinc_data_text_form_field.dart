import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
bool edit = false;
// ignore: must_be_immutable
class ClinicTextFormField extends StatefulWidget {
   ClinicTextFormField({Key? key,
     this.minLines =1,
     required this.hint,  this.isPassword = true,  this.enabled, this.validators, required this.controller, required this.textInputAction, required this.textInputType, required this.onTap}) : super(key: key);
  final String hint;
  final bool isPassword;
  final bool? enabled;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final VoidCallback onTap;
  int? minLines;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  State<ClinicTextFormField> createState() => _ClinicTextFormFieldState();
}

class _ClinicTextFormFieldState extends State<ClinicTextFormField> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          TextFormField(
            minLines: widget.minLines,
            maxLines: 10,
            enabled: edit == true,
            validator: widget.validators,

            controller: widget.controller,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(

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
          Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                  BorderRadius.only(
                      topRight:
                      Radius.circular(
                          15.sp),
                      bottomLeft:
                      Radius.circular(
                          15.sp))),
              child: edit == false ?
              InkWell(
                onTap: (){
                  setState(() {
                    edit = !edit;
                  });
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ): InkWell(
                  onTap: widget.onTap,
                  child: const Icon(Icons.done,color: Colors.white,)) )
        ],
      ),
    );
  }
}

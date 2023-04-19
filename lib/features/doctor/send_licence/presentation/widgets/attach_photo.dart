import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AttachPhoto extends StatefulWidget {
   AttachPhoto({Key? key, required this.onTap, required this.widget, required this.hint,}) : super(key: key);
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  final GestureTapCallback onTap;
  final Widget widget;
  final String hint;
  EdgeInsetsGeometry? padding;
  @override
  State<AttachPhoto> createState() => _AttachPhotoState();
}

class _AttachPhotoState extends State<AttachPhoto> {
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: widget.margin,
        child: Column(
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: TextFormField(

                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {
                      setState(() {
                      });
                    },
                    child: widget.widget,
                  ),
                  hintText: widget.hint,
                  focusColor: Colors.grey.shade200,
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  enabled: false,
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
            ),
          ],
        ),
      );
    }
}

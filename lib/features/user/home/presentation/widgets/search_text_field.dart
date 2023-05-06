import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class SearchTextFiled extends StatefulWidget {
  SearchTextFiled({
    Key? key,
    this.borderRadius,
    this.margin,
    this.padding, required this.hint,
  }) : super(key: key);
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final String hint;
  @override
  State<SearchTextFiled> createState() => _SearchTextFiledState();
}

class _SearchTextFiledState extends State<SearchTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        children: [

          TextFormField(
            enabled: false,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
              focusColor: Colors.grey.shade200,
              fillColor: Colors.grey.shade200,
              filled: true,

              prefixIcon: const Icon(Icons.search),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
                borderRadius: BorderRadius.circular(13.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

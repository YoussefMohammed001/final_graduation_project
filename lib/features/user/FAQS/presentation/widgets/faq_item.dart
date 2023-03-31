import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(17.sp)
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent, unselectedWidgetColor: Colors.black, // here for close state
            colorScheme: ColorScheme.light(
              primary: Colors.black,
            ), ),
        child: ExpansionTile(
          iconColor: Colors.black,
          title: Text("Question",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          children: [

            Divider(
              thickness: 4.sp,
              color: Colors.grey.shade400,
            ),
            Padding(
              padding:  EdgeInsets.all(12.sp),
              child: Text("dddddddddd dddddddddddd QuestionQuestionQuestionQuestionQuestionQuestionQuestion QuestionQuestion Question Question Question Question Question",style: TextStyle(color: Colors.grey[400]),),
            ),

          ],
            ),
      ),
    );
  }
}

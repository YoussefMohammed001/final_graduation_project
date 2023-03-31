import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
 DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child:  Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(45.sp),
                color: Colors.grey[200],
                child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7,
                crossAxisSpacing: 6.sp,
                  mainAxisSpacing: 6.sp

                ),
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp)
                        )
                        ,child: Center(child: Text("1"))),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

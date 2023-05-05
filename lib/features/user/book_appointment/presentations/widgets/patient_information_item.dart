import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/appointment_text_form_filed.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PatientInformationItem extends StatefulWidget {
  const PatientInformationItem(
      {Key? key,
      required this.patientName,
      required this.patientMobile,
      required this.patientNameController,
      required this.patientMobileController, required this.noteController, required this.patientNote,
      })
      : super(key: key);
  final String patientName;
  final String patientMobile;
  final String patientNote;
  final TextEditingController patientNameController;
  final TextEditingController patientMobileController;
  final TextEditingController noteController;

  @override
  State<PatientInformationItem> createState() => _PatientInformationItemState();
}

class _PatientInformationItemState extends State<PatientInformationItem> {
  bool anotherPatient = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.sp),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.sp),
                    ),
                    padding: EdgeInsets.all(5.sp),
                    child: const Icon(
                      Icons.medical_information_outlined,
                      color: AppColors.primary,
                    )),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  S().patientInformation,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            color: anotherPatient == true
                                ? Colors.blue[900]
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(50.sp)),
                        child: GestureDetector(
                            onTap: () {
                              anotherPatient = !anotherPatient;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.done,
                              color: Colors.grey[200],
                              size: 17.sp,
                            ))),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(S().iAmReservingInBehalfOfAnotherPatient),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    AppointmentTextFormField(
                      validators: (value){
                        if(anotherPatient == true & value.isEmpty){
                          return "Enter patient name";
                        }
                      },
                      hint: widget.patientName,
                      title: S().patientName,
                      enabled: anotherPatient,
                      hintDisabled: widget.patientName,
                      hintEnabled: S().username,
                      controller: widget.patientNameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppointmentTextFormField(
                      validators: (value){
                        if(anotherPatient == true & value.isEmpty){
                          return "Enter patient mobile";
                        }
                      },
                      hint: widget.patientMobile,
                      title: 'Patient Mobile',
                      enabled: anotherPatient,
                      hintDisabled: widget.patientMobile,
                      hintEnabled: S().phoneNumber,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      controller: widget.patientMobileController,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AppointmentTextFormField(
                      hint: widget.patientNote,
                      title: 'Note',
                      enabled: true,
                      hintDisabled: widget.patientNote,
                      hintEnabled: S().note,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      controller: widget.noteController,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/features/Authentication/on_boarding/presentaion/widgets/on_boarding_widget.dart';
import 'package:final_graduation_project/features/Authentication/register/presentation/pages/doctor_or_patient.dart';
import 'package:flutter/material.dart';

PageController indicatorController = PageController();
bool lastPage = false;

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  List<Screens> screens = [
    Screens("assets/images/onboarding.png", "Thousands of doctors",
        "Access thousands ofDoctors instantly. \n You can easily contact with the doctors and "),
    Screens("assets/images/onboarding.png", "Live talk with doctor",
        "Easily connect with doctor and start video\n chat for your better treatment & Prescription."),
    Screens("assets/images/onboarding.png", "Chat with doctors",
        "Easily connect with doctor and start video\n chat for your better treatment & Prescription"),
  ];

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      controller: indicatorController,
      onPageChanged: (value) {
        setState(() {
          lastPage = (value == 2);
        });
      },
      itemBuilder: (context, index) => OnBoardingWidget(
        title: widget.screens[index].title,
        subTitle: widget.screens[index].subtitle,
        image: widget.screens[index].image,
        onPressed: () {
          MyShared.putBoolean(key: MySharedKeys.firstOpen, value: false);
          lastPage
              ? pushAndRemoveUntil(context, const DoctorOrPatientScreen())
              : indicatorController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
        },
        onTap: () {
          MyShared.putBoolean(key: MySharedKeys.firstOpen, value: false);
          pushAndRemoveUntil(context, const DoctorOrPatientScreen());
        },
      ),
      itemCount: widget.screens.length,
    ));
  }
}

class Screens {
  String image;
  String title;
  String subtitle;

  Screens(this.image, this.title, this.subtitle);
}

import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/contact_us/presentation/widgets/contact_us_item.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const CustomAppBar(title: 'Contact Us',),
          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children:  [

                          ContactUsItem()
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

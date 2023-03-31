import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/FAQS/presentation/widgets/faq_item.dart';
import 'package:flutter/material.dart';

class UserFAQS extends StatelessWidget {
  const UserFAQS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const CustomAppBar(title: 'FAQS',),
          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: const [
                          FaqItem(),
                          FaqItem(),
                          FaqItem(),
                          FaqItem(),
                          FaqItem(),
                          FaqItem(),
                          FaqItem(),
                          FaqItem(),
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

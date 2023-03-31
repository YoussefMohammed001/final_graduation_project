import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/text_item.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const CustomAppBar(title: 'About Us',),
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
                          TextItem(title: 'About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.About us details here.',)
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

import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/text_item.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
           CustomAppBar(title:S().termsAndConditions,),
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
                          TextItem(title: 'Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.Terms and conditions will be here.',),
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

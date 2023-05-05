import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/contact_us/presentation/manager/contact_us_model_cubit.dart';
import 'package:final_graduation_project/features/user/contact_us/presentation/widgets/contact_us_item.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController name  = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController note = TextEditingController();
  final cubit = ContactUsModelCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
           CustomAppBar(title: S().contactUs,),
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

                          ContactUsItem(name: name, email: email, note: note, onPress: () {
                            cubit.contactUs(name: name.text, email: email.text, note: note.text);
                          },)
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

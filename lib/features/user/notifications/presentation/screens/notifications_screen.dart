import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/notifications/presentation/widgets/notification_widgets.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           CustomAppBar(
            title: S().notifications,
          ),
          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(

                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                         Expanded(
                           child: SizedBox(
                             height: 25.h,
                             child: ListView.builder(
                               shrinkWrap: false,
                               itemBuilder: (BuildContext context, int index) {
                               return NotificationItem(title: 'Notifications content will be here.Notifications content will be here.', time: '35 min ago',);
                             },
                             itemCount: 5,
                             ),
                           ),
                         )
                          ],
                        ),
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

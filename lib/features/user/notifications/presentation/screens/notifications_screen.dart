import 'package:final_graduation_project/core/cubits/notifications/new_notifications_cubit.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/notifications/data/get_notification_data_model.dart';
import 'package:final_graduation_project/features/user/notifications/presentation/manager/get_notification_cubit.dart';
import 'package:final_graduation_project/features/user/notifications/presentation/widgets/notification_widgets.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final cubit = GetNotificationCubit();
  final notify = NewNotificationsCubit();

  @override
  void initState() {
    notify.getNotifications();
    cubit.getNotifications();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<GetNotificationCubit, GetNotificationState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                CustomAppBar(
                  title: S().notifications,
                ),
                Expanded(
                  child: LayoutBuilder(
                      builder: (context, constrains) =>
                          SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constrains.maxHeight,
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    cubit.seenNotification != null
                                        ? Expanded(
                                      child: SizedBox(
                                        height: 25.h,
                                        child: ListView.builder(
                                          shrinkWrap: false,
                                          itemBuilder:
                                              (BuildContext context,
                                              int index) {
                                            SeenNotification
                                            seenNotification =
                                            cubit.seenNotification[
                                            index];
                                            return NotificationItem(
                                              title:
                                              seenNotification.type,
                                              time: seenNotification
                                                  .message,
                                            );
                                          },
                                          itemCount: cubit
                                              .seenNotification.length,
                                        ),
                                      ),
                                    )
                                        : Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        const AppSVG(assetName: "empty"),
                                        SizedBox(height: 1.h,),
                                        const Text(
                                          "You don't have notifications",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

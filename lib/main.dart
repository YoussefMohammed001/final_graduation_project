import 'dart:async';

import 'package:final_graduation_project/core/api/AI_dio.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/cubits/language/language_cubit.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/screens/add_clinic_data.dart';
import 'package:final_graduation_project/features/splash/presentation/splash_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

const String portName = 'notification_send_port';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MyShared.init();
  AppDio.init();
  AIDio.init();
  EasyLoading.init();
  initLocalNotification();
   FirebaseMessaging.instance.getToken().then((value) async {
    safePrint("token=> ${value!}");
    await MyShared.putString(key: MySharedKeys.FirebaseToken, value: value);
    safePrint("==========>${MyShared.getString(key: MySharedKeys.FirebaseToken)}");
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.body}');
      _showNotification(message.notification!.title.toString(),
          message.notification!.body.toString());
    }
  });



  FirebaseMessaging.onBackgroundMessage(
    (RemoteMessage message) async {
      safePrint('Got a message whilst in the foreground!');
      safePrint('Message data: ${message.data}');
      _showNotification(message.notification!.title.toString(),
          message.notification!.body.toString());
    },
  );
  safePrint(MyShared.getString(key: MySharedKeys.apiToken));
  safePrint("Firebase==========>${MyShared.getString(key: MySharedKeys.FirebaseToken)}");
if(MyShared.getString(key: MySharedKeys.id).isNotEmpty){
  var respones = await AppDio.post(endPoint: "/user/addNotify/${MyShared.getString(key: MySharedKeys.id)}",data: {
    "token":MyShared.getString(key: MySharedKeys.FirebaseToken),

  });
  safePrint("response==>$respones");
}
  runApp(const MyApp());
}

void initLocalNotification() async {
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings();
  const LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(defaultActionName: 'Open notification');
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}


Future<void> _showNotification(String title, String body) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    notificationDetails,
    payload: 'item x',
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LanguageCubit(),
        child: BlocBuilder<LanguageCubit, LanguageState>(
            buildWhen: (previous, current) => current is ChangeLanguageState,
            builder: (context, state) {
              return ResponsiveSizer(
                builder: (context, orientation, screenType) {
                  return MaterialApp(
                    key: ValueKey(MyShared.getCurrentLanguage()),
                    debugShowCheckedModeBanner: false,
                    // ignore: deprecated_member_use
                    useInheritedMediaQuery: true,
                    locale: Locale(MyShared.getCurrentLanguage()),
                    supportedLocales: S.delegate.supportedLocales,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    color: AppColors.primary,
                    builder: EasyLoading.init(),
                    home:  SplashScreen(),
                  );
                },
              );
            }));
  }
}

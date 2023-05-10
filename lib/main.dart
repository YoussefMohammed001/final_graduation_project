import 'package:final_graduation_project/core/api/AI_dio.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/cubits/language/language_cubit.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/splash/presentation/splash_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  AppDio.init();
  AIDio.init();
  EasyLoading.init();
  safePrint(MyShared.getString(key: MySharedKeys.apiToken));



  runApp(const MyApp());
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
                    home:   const SplashScreen(),


                  );
                },
              );
            }));
  }
}
import 'dart:convert';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitialState());
  static dynamic language;

  Future<void> getLanguageFromServer() async {
    var value = await AppDio.get(endPoint: EndPoints.language);
    dynamic language;




    var keys = jsonEncode(language);

    await MyShared.putString(key: MySharedKeys.languageKeys, value: keys);

    getLanguageFromLocal();
  }

  void getLanguageFromLocal() {
    var stringKeys = MyShared.getString(key: MySharedKeys.languageKeys);

    language = jsonDecode(stringKeys);
  }

  void changeLanguage() async {
    emit(ChangeLanguageState());
  }

  void changeLanguageToEn() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: "en");
    emit(ChangeLanguageState());
  }

  void changeLanguageToAr() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: "ar");
    emit(ChangeLanguageState());
  }
}

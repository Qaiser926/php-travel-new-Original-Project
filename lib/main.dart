
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/language_translation_string/localLanguageString.dart';
import 'package:phptravelapp/routes/app_pages/app_pages.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  // runApp(DevicePreview(builder: (context)=>travelapp()));
  runApp(travelapp());
}
class travelapp extends StatelessWidget {
  const travelapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      translations: LocalLanguageString(),
      locale: Locale('en','EN'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}

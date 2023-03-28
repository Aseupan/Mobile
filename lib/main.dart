import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/global/global_binding.dart';
import 'package:mobile/routes/app_pages.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/services/api/app_token.dart';
import 'package:mobile/services/global_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) => GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: GetMaterialApp(
              initialBinding: GlobalBinding(),
              title: 'GSC Berkah',
              theme: GlobalTheme(),
              getPages: appRouter(),
              initialRoute:
                  AppToken.checkToken() ? RoutePage.home : RoutePage.onBoarding,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child ?? Container(),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

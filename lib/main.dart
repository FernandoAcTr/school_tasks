import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:school_tasks/ui/routes/pages.dart';

void main() async {
  //default locale
  await initializeDateFormatting('es_MX', null);
  Intl.defaultLocale = 'es_MX';
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}

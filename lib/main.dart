import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled1/services/dio_helper.dart';
import 'package:untitled1/services/quiz_dio_helper.dart';
import 'package:untitled1/src/app_root.dart';

import 'Hive/hive_service.dart';
import 'models/class_topic.g.dart';

void   main() async {
  DioHelper.init();
  QuizDioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<List>('started_courses');

  Hive.registerAdapter(topicAdapter());
  Hive.registerAdapter(DetailsAdapter());

  if (!Hive.isBoxOpen('topicsBox')) {
    await Hive.openBox<dynamic>('topicsBox');

    runApp(AppRoot());
  }
}
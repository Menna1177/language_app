import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../bloc/auth_cubit.dart';
import '../bloc/quiz_cubit.dart';
import '../bloc/topic_cubit.dart';
import '../models/class_topic.dart';
import '../screens/welcome_page.dart';

class AppRoot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Box<topic> box;

    return ScreenUtilInit(
      designSize: Size(360,690),
      splitScreenMode: true,
      minTextAdapt: true,

      builder:(context,child){
        return MultiBlocProvider(providers:
        [
          BlocProvider(create:
              (context) => AuthCubit()
          ),
          BlocProvider(create: (context)=>QuizCubit())
          ,  BlocProvider(create: (_) => TopicCubit()),
        ]
            , child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: WelcomePage(),

            ));
      } ,
    );
  }

}
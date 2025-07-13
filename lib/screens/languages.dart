import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:untitled1/screens/profile_page.dart';
import 'package:untitled1/screens/topics.dart';

import '../Hive/hive_service.dart';
import '../bloc/auth_cubit.dart';
import '../models/languages_model.dart';
class languagesPages extends StatelessWidget {

  languagesPages({super.key});

  final List<language_model> languages=[language_model('Python','assets/images/img.png'),
    language_model('HTML','assets/images/img_1.png'),
    language_model('Angular','assets/images/img_2.png'),
    language_model('JavaScript','assets/images/img_3.png'),
    language_model('React','assets/images/img_4.png'),
  ];
  void SaveCourses(String useremail, String coursename)
  {
    final box =Hive.box<List>('started_courses');
    List startedcourses=box.get(useremail,defaultValue: [])!;
    if(!startedcourses.contains(coursename))
    {
      startedcourses.add(coursename);
      box.put(useremail, startedcourses);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F6F8),
      endDrawer: ProfileDrawer(),
      appBar:
      AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor:  Color(0xff046582),
      ),
      body:
      ListView.builder( itemCount: languages.length,itemBuilder:(context,index)
      {
        final lang = languages[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children:
              [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        lang.icon_image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Expanded(child: Text(lang.name, style:TextStyle(color:Colors.black,fontSize: 16,fontWeight:FontWeight.bold), )),






                  ],
                ),



                const SizedBox(height: 10),

                Align(
                  alignment:Alignment.centerLeft,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFFBE0B)),
                    onPressed: () async {
                      final authModel = context.read<AuthCubit>().model;

                      if (authModel == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please login first')),
                        );
                        return;
                      }

                      final useremail = authModel.email;
                      await initializeData(lang.name ,useremail!);

                      SaveCourses(useremail!, lang.name);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Started Course: ${lang.name}')),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TopicsScreen(language: lang.name, email: useremail,),
                        ),
                      );
                    },
                    child: const Text(
                      'Start now',
                      style: TextStyle(color: Colors.white),

                    ),
                  ),



                )],
            ),
          ),
        );
      }),




    );
  }
}
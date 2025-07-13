import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:untitled1/screens/welcome_page.dart';


import '../bloc/auth_cubit.dart';
class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final auth=context.watch<AuthCubit>();
    String? name;
    String? email;
    if(auth.model!=null)
    {

      name=auth.model!.name;
      email=auth.model!.email;
    }
    return Drawer(
      backgroundColor:Colors.white ,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff046582),
            ),
            child:Row(
              children:[
                const CircleAvatar(
                  radius:30,
                  backgroundColor:Colors.white,
                  child:Icon(Icons.person, size: 40, color: Colors.black,),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(name??"Guest", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,)),
                    Text(email??"", style: TextStyle(color: Colors.white70),),
                  ],
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.play_arrow, color: Colors.black),
            title: Text('Started Courses'),
            onTap: () {
              final authModel = context.read<AuthCubit>().model;

              if (authModel == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please login first")),
                );
                return;
              }

              final useremail = authModel.email;
              final box = Hive.box<List>('started_courses');
              final started = box.get(useremail, defaultValue: []);

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Started Courses',style: TextStyle(color: Color(0xff046582)),),
                  content: started!.isEmpty
                      ? Text("No courses started yet.",style: TextStyle(color: Color(0xff046582)),)
                      : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: started.map((e) => Text('• $e',style: TextStyle(color: Color(0xff046582)),)).toList(),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close',style: TextStyle(color: Color(0xffFFBE0B)),),
                    ),
                  ],
                ),
              );
            },


          ),

          ListTile(
            leading:Icon(Icons.exit_to_app, color: Colors.black),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
                    (route) => false,
              );            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/quiz_cubit.dart';
import 'languages.dart';

class QuizScreen extends StatefulWidget{
  String tags;
  QuizScreen({
    super.key,
    required this.tags
  });

  @override
  State<StatefulWidget> createState() => _QuizScreenState();


}

class _QuizScreenState extends State<QuizScreen>{
  @override
  void initState()
  { super.initState();
  context.read<QuizCubit>().GetQuestions( tags: widget.tags);//i will change this later
  }
  Map<int,String?> selectedanswers={};
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffF4F6F8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(onPressed: () { Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => languagesPages()),
                (route) => false,
          ); },icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          backgroundColor: Color(0xff046582),
          title: Padding(
            padding:  EdgeInsets.only(top:9.h),
            child: Text(
              'Quiz',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<QuizCubit,QuizState>(
          builder:(context,state){
            if(state is QuizResponseLoading)
            {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff90E0EF)),
                  backgroundColor: Color(0xffCAF0F8),
                ),
              );
            }
            else if (state is QuizResponseError)
            {
              return Center(
                child: Text(state.error_message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:Color(0xffff0000),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                  ),),
              );
            }
            else if(state is QuizResponseSuccess)
            {
              return ListView.builder(
                  itemCount: state.questions.length
                  ,itemBuilder: (context,index){
                final turn=state.questions[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Q${index+1}: ${turn.question}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Color(0xff046582)

                        ),
                      ),
                      SizedBox(height: 8.h,),
                      ...turn.answers!.entries.where((entry) => entry.value!=null).map((entry) => RadioListTile
                        (title: Text(entry.value!,

                      ),
                          value: entry.key,
                          groupValue: selectedanswers[index],
                          activeColor: Color(0xff046582),
                          onChanged: (value)
                          {
                            setState(() {
                              selectedanswers[index]=value;
                            });
                          }
                      )
                      ).toList(),
                      Divider(
                        thickness: 1.5.w,
                        color: Color(0xff242124),

                      ),
                      if(index==state.questions.length -1)
                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:Color(0xffFFB703) ,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),


                                  )
                              ),
                              onPressed: (){
                                int correct=0;
                                for(int i=0;i<state.questions.length;i++)
                                {
                                  if (selectedanswers[i] != null &&
                                      selectedanswers[i] == state.questions[i].correctAnswer) {
                                    correct++;
                                  }

                                }
                                showDialog(context: context
                                    , builder: (context)=>AlertDialog(
                                      backgroundColor: Colors.white ,
                                      title: Text('You answered ${correct} out of ${state.questions.length} correclty',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color:
                                          Color(0xff046582),


                                        ),
                                      ),
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (context) => languagesPages()),
                                                (route) => false,
                                          );
                                        }
                                            , child: Text("Ok",style: TextStyle(
                                                color: Color(0xffFFBE0B),
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.bold
                                            ),))
                                      ],


                                    )
                                );

                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp
                                ),
                              ),
                            ),
                          ),
                        )


                    ],
                  ),
                );


              }
              );
            }
            else
            {
              return Center(
                  child:Text("Something Went Wrong",
                    style: TextStyle(
                        color: Color(0xffff0000),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                    ),
                  )
              );
            }
          }
      ),



    );
  }

}
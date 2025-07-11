import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/quiz_question.dart';
import '../services/quiz_dio_helper.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  Future<void>GetQuestions({
    required String tags,
    String difficulty='Easy',
    int numofquestions=10

  })async{
    emit(QuizResponseLoading());

    try{
      final response= await QuizDioHelper.getquiz(
        'questions',{
        'tags':tags,
        'difficulty':difficulty,
        'limit':numofquestions
      },
      );
      final List data=response.data;
      final List<QuizQuestion>questions=data.map((e) =>QuizQuestion.fromJson(e)).toList();
      emit(QuizResponseSuccess(questions));


    }catch(e)
    {
      emit(QuizResponseError("Failed To Load Quiz Questions.Try Again"));
    }
  }



}
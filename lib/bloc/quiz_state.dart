part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}
final class QuizResponseLoading extends QuizState{}
final class QuizResponseSuccess extends QuizState{
  final List<QuizQuestion> questions;
  QuizResponseSuccess(
      this.questions
      );
}
final class QuizResponseError extends QuizState{
  final String error_message;
  QuizResponseError(this.error_message);
}
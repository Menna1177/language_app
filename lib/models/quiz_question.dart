class QuizQuestion {
  final String question;
  final Map<String, String?> answers;
  final String? correctAnswer;

  QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });


  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    final correctAnswersMap = json['correct_answers'] as Map<String, dynamic>;
    String? correctAnswerKey;

    correctAnswersMap.forEach((key, value) {
      if (value == "true") {
        correctAnswerKey = key.replaceAll("_correct", "");
      }
    });

    return QuizQuestion(
      question: json['question'] ?? '',
      correctAnswer: correctAnswerKey,
      answers: json['answers'] != null
          ? Map<String, String?>.from(json['answers'])
          : {},
    );
  }
}
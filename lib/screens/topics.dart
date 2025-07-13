import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens/profile_page.dart';
import 'package:untitled1/screens/quiz_screen.dart';
import '../bloc/topic_cubit.dart';
import '../bloc/topic_state.dart';
import '../comp/topic_card.dart';


class TopicsScreen extends StatelessWidget {
  final String language;
  final String email;

  const TopicsScreen({
    super.key,
    required this.language,
    required this.email,

  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopicCubit()..loadTopics(language, email),
      child: Scaffold(
        endDrawer: ProfileDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: const Color(0xff046582),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Topics of $language",
            style: const TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        body: BlocBuilder<TopicCubit, TopicState>(
          builder: (context, state) {
            if (state is TopicsLoaded) {
              final progressPercent = (state.progress * 100).toInt();

              if (state.progress == 1.0) {
                Future.delayed(Duration.zero, () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Congratulations!',
                          style: TextStyle(color: Color(0xff046582),fontWeight: FontWeight.bold)),
                      content: const Text(
                          'You have completed all topics! Ready for the quiz?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QuizScreen(tags: language),
                              ),
                            );
                          },
                          child: const Text('Go to Quiz',
                              style: TextStyle(color: Color(0xff046582))),
                        ),
                      ],
                    ),
                  );
                });
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your progress $progressPercent%",
                      style: const TextStyle(
                        color: Color(0xff046582),
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      child: LinearProgressIndicator(
                        value: state.progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xff00B4D8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.topics.length,
                        itemBuilder: (context, index) {
                          final t = state.topics[index];
                          return TopicCard(
                            topic: t.name,
                            done: t.done,
                            language: t.language,
                            email: email,
                            onRefresh: () {
                              context.read<TopicCubit>().loadTopics(language, email);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );

            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}


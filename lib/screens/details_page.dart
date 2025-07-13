import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens/profile_page.dart';

import '../bloc/topic_cubit.dart';
import '../bloc/topic_state.dart';
import '../comp/codeBlock.dart';
import '../comp/vedio.dart';
import '../models/class_topic.dart';


class DetailsPage extends StatelessWidget {
  final String topicName;
  final String languageName;
  final bool isDone;
  final String email;

  const DetailsPage({
    super.key,
    required this.topicName,
    required this.languageName,
    required this.isDone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final topicFromMap = topics[languageName]
        ?.firstWhere(
          (t) => t.name == topicName,
      orElse: () => topic(name: "", done: false, language: languageName, details: []),
    ) ??
        topic(name: "", done: false, language: languageName, details: []);

    final detailsList = topicFromMap.details;

    return BlocBuilder<TopicCubit, TopicState>(
      builder: (context, state) {
        bool isDoneVal = isDone;

        if (state is TopicsLoaded) {
          final updatedTopic = state.topics.firstWhere(
                (el) => el.name == topicName && el.language == languageName,
            orElse: () => topic(name: "", done: false, language: languageName, details: []),
          );
          isDoneVal = updatedTopic.done;
        }

        return Scaffold(
          endDrawer: ProfileDrawer(),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: const Color(0xff046582),
            title: Text("$topicName in $languageName",
                style: const TextStyle(color: Colors.white)),
          ),
          body: ListView.builder(
            itemCount: detailsList.length,
            itemBuilder: (context, index) {
              final detail = detailsList[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detail.topicName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff046582))),
                    const SizedBox(height: 10),
                    Text(detail.details),
                    const SizedBox(height: 10),
                    if (detail.code.isNotEmpty) codeBlock(code: detail.code),
                    const SizedBox(height: 20),
                    if (detail.error.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Error:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          const SizedBox(height: 8),
                          codeBlock(code: detail.error),
                        ],
                      ),
                    const SizedBox(height: 10),
                    const Text("Resource:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff046582))),
                    const SizedBox(height: 10),
                    VideoPlayerWidget(url: detail.url),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: isDoneVal
                          ? null
                          : () {
                        context.read<TopicCubit>().markAsComplete(
                            topicName, languageName, email);
                        Navigator.pop(context, true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isDoneVal ? Colors.grey : const Color(0xffFFBE0B),
                      ),
                      child: Text(isDoneVal ? 'Completed' : 'Mark as Complete',
                          style: const TextStyle(color: Colors.white)),

                    ),
                    const Divider(thickness: 1),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}


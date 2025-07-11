import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../conponent/codeBlock.dart';
import '../conponent/vedio.dart';
import '../cubit/topic__state.dart';
import '../model/class_topic.dart';
import '../cubit/topic__cubit.dart';

class DetailsPage extends StatelessWidget {
  final String topicName;
  final String languageName;
  final bool isDone;

  const DetailsPage({
    super.key,
    required this.topicName,
    required this.languageName,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicCubit, TopicState>(
      builder: (context, state) {
        topic t = topic(
          name: "",
          done: false,
          language: languageName,
          details: [],
        );

        if (state is TopicsLoaded) {
          t = state.topics.firstWhere(
            (el) => el.name == topicName && el.language == languageName,
            orElse: () => t,
          );
        }

        final detailsList = t.details;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff046582),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<TopicCubit>().loadTopics(languageName);
              },
              icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
            ),
            title: Text(
              "$topicName in $languageName",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: detailsList.isEmpty
              ? Center(
                  child: Text(
                    "No details found.",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                )
              : ListView.builder(
                  itemCount: detailsList.length,
                  itemBuilder: (context, index) {
                    final detail = detailsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detail.topicName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff046582),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(detail.details),
                          const SizedBox(height: 10),
                          if (detail.code.isNotEmpty)
                            codeBlock(code: detail.code),
                          const SizedBox(height: 20),
                          if (detail.error.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Error:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                codeBlock(code: detail.error),
                                const SizedBox(height: 10),
                              ],
                            ),
                          const Text(
                            "Resource: ",
                            style: TextStyle(
                              color: Color(0xff046582),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          VideoPlayerWidget(url: detail.url),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: t.done
                                ? null
                                : () {
                                    context
                                        .read<TopicCubit>()
                                        .markAsComplete(topicName, languageName);
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: t.done
                                  ? Colors.grey
                                  : const Color(0xff046582),
                            ),
                            child: Text(
                              t.done ? 'Completed' : 'Mark as Complete',
                              style: const TextStyle(color: Colors.white),
                            ),
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

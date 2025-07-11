import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:untitled1/bloc/topic_state.dart';

import '../models/class_topic.dart';

class TopicCubit extends Cubit<TopicState> {
  TopicCubit() : super(TopicInitial());
  final box = Hive.box('topicsBox');

  void loadTopics(String language, String email) {
    final key = "$email-$language";

    if (!box.containsKey(key)) {
      final defaultList = topics[language];
      if (defaultList != null) {
        box.put(key, defaultList.map((t) =>
            topic(
              name: t.name,
              done: false,
              language: t.language,
              details: t.details,
            )).toList());
      }
    }

    final List<dynamic>? list = box.get(key);

    if (list != null) {
      final topicsList = List<topic>.from(list);
      final doneCount = topicsList
          .where((t) => t.done)
          .length;
      final progress = topicsList.isEmpty ? 0 : doneCount / topicsList.length;
      emit(TopicsLoaded(topics: topicsList, progress: progress.toDouble()));
    } else {
      emit(TopicsLoaded(topics: [], progress: 0));
    }
  }

  void markAsComplete(String topicName, String language, String email) {
    final key = "$email-$language";
    final List<dynamic>? rawList = box.get(key);
    if (rawList == null) return;

    final topicsList = List<topic>.from(rawList);

    final index = topicsList.indexWhere(
          (t) => t.name == topicName && t.language == language,
    );

    if (index != -1) {
      topicsList[index].done = true;
      box.put(key, topicsList);
      loadTopics(language, email);
    }
  }
}

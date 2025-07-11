

import '../models/class_topic.dart';

abstract class TopicState {}

class TopicInitial extends TopicState {}

class TopicsLoaded extends TopicState {
  final List<topic> topics;
  final double progress;

  TopicsLoaded({
    required this.topics,
    required this.progress,
  });
}

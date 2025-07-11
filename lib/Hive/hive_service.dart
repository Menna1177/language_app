
import 'package:hive/hive.dart';
import '../models/class_topic.dart';

Future<void> initializeData(String language, String userEmail) async {
  final box = Hive.box<dynamic>('topicsBox');
  final userKey = "$userEmail-$language";

  if (!box.containsKey(userKey)) {
    final data = topics[language];
    if (data != null) {
      final userTopics = data.map((t) => topic(
        name: t.name,
        done: false,
        language: t.language,
        details: t.details,
      )).toList();

      box.put(userKey, userTopics);
      print("Topics for $language saved for $userEmail");
    }
  }
}



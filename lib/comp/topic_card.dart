import 'package:flutter/material.dart';
import '../screens/details_page.dart';



class TopicCard extends StatelessWidget {
  final String topic;
  final String language;
  final bool done;
  final String email;
  final VoidCallback onRefresh;

  const TopicCard({
    super.key,
    required this.topic,
    required this.done,
    required this.language,
    required this.email,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(topic,style: TextStyle(color:Color(0xff046582) ),),
        leading: done
            ? const Icon(Icons.fiber_manual_record, color: Color(0xff046582))
            : const Icon(Icons.fiber_manual_record_outlined, color: Color(0xff046582)),
        trailing: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  topicName: topic,
                  languageName: language,
                  isDone: done,
                  email: email,
                ),
              ),
            ).then((reloadNeeded) {
              if (reloadNeeded == true) {
                onRefresh();
              }
            });
          },
          child: const Text(
            "View",
            style: TextStyle(color: Color(0xffFFBE0B)),
          ),
        ),
      ),
    );
  }
}



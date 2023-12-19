import 'package:flutter/material.dart';

// 학습 자료를 나타내는 모델
class LearningResource {
  final String title;
  final String description;
  final String url;

  LearningResource({
    required this.title,
    required this.description,
    required this.url,
  });
}

class LearningPathPage extends StatelessWidget {
  final String toolName;
  final List<LearningResource> resources;

  LearningPathPage({Key? key, required this.toolName, required this.resources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$toolName 학습 경로'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          LearningResource resource = resources[index];
          return Card(
            child: ListTile(
              title: Text(resource.title),
              subtitle: Text(resource.description),
              onTap: () {
                // URL을 열거나, 추가 정보를 제공하는 화면으로 이동
              },
            ),
          );
        },
      ),
    );
  }
}

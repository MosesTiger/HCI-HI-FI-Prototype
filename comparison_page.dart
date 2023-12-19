import 'package:flutter/material.dart';
import 'roadmap.dart';

class ComparisonPage extends StatefulWidget {
  final List<String> selectedEngines;

  const ComparisonPage({Key? key, required this.selectedEngines}) : super(key: key);

  @override
  _ComparisonPageState createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  // 예시 특징들을 담은 데이터 구조
  final Map<String, List<String>> engineFeatures = {
    'UNITY': [
      'Cross-platform support',
      'High-quality visuals',
      'Large developer community',
      'Comprehensive asset store',
    ],
    'UNREAL': [
      'Advanced rendering capabilities',
      'Full source code access',
      'Robust multiplayer framework',
      'Detailed documentation',
    ],
    'GOBOT': [
      'Advanced rendering capabilities',
      'Full source code access',
      'Robust multiplayer framework',
      'Detailed documentation',
    ],
    'CryEngine': [
      'Advanced rendering capabilities',
      'Full source code access',
      'Robust multiplayer framework',
      'Detailed documentation',
    ],
  };

  void _goToRoadmap(String selectedStackName) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RoadmapPage(selectedEngine: selectedStackName, developmentType: '',),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스택 비교'),
      ),
      body: Column(
        children: widget.selectedEngines.map((engine) {
          return Expanded(
            child: Card(
              child: Column(
                children: [
                  Text(engine, style: TextStyle(fontWeight: FontWeight.bold)),
                  ...engineFeatures[engine]!.map((feature) => ListTile(title: Text(feature))).toList(),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.selectedEngines.isNotEmpty) {
            // 첫 번째 선택된 엔진의 이름을 로드맵 페이지로 전달
            _goToRoadmap(widget.selectedEngines.first);
          }
        },
        child: Icon(Icons.check),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
      ),
    );
  }
}

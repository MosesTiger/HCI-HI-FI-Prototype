import 'package:flutter/material.dart';
import 'EngineSelectionScreen.dart'; // 엔진 선택 화면 import

class RoadmapPage extends StatelessWidget {
  final String developmentType; // 개발 유형 파라미터
  final String selectedEngine; // 선택된 엔진 파라미터

  const RoadmapPage({
    Key? key,
    required this.developmentType,
    required this.selectedEngine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> roadmapItems = {
      '엔진': selectedEngine.isNotEmpty ? selectedEngine : '/engineSelection',
      '애니메이터': '/animator',
      '개발언어': '/devLanguage',
      '3D모델': '/3dModel',
      'OST': '/ost',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('로드맵 $developmentType'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: roadmapItems.entries.map((entry) {
            return RoadmapItem(title: entry.key, route: entry.value);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build_circle), // 아이콘을 변경했습니다.
            label: '선택 페이지', // 텍스트를 변경했습니다.
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pop();
          } else if (index == 1) {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EngineSelectionScreen()),
            );
          }
        },
      ),
    );
  }
}

class RoadmapItem extends StatelessWidget {
  final String title;
  final String route;

  const RoadmapItem({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20.0),
        ),
        onPressed: () {
          if (route.startsWith('/')) {
            Navigator.pushNamed(context, route);
          } else {
            // 선택된 엔진이 있을 경우 다이얼로그를 표시하거나 다른 로직을 실행
            // 선택된 엔진이 없을 경우 EngineSelectionScreen으로 이동
            if (route.isEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EngineSelectionScreen()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EngineSelectionScreen()),
              );
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Icon(Icons.arrow_forward_ios, size: 16.0),
          ],
        ),
      ),
    );
  }
}

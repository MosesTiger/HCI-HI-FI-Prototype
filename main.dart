import 'package:flutter/material.dart';
import 'home_page.dart'; // 홈 페이지
import 'build_page.dart'; // 빌드 선택 페이지
import 'stack_map.dart';
import 'stack_selection.dart';
import 'EngineSelectionScreen.dart';
import 'unity_description.dart';
import 'resource_link.dart';
import 'comparison_page.dart';
import 'roadmap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/build': (context) => BuildPage(),
        '/stackMap': (context) => StackMapPage(),
        '/stackSelection': (context) => StackSelection(),
        '/engineSelection': (context) => EngineSelectionScreen(),
        '/unityDescription': (context) => UnityDescriptionPage(),
        '/resourceLink': (context) => ResourceLinkPage(),
        '/comparison': (context) => ComparisonPage(selectedEngines: const [],),
        '/roadmap': (context) => RoadmapPage(developmentType: '', selectedEngine: '',),
        // 다른 라우트를 여기에 추가합니다...
      },
    );
  }
}

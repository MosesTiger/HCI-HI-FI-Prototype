import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UnityDescriptionPage extends StatelessWidget {
  // Unity에 대한 상세 설명 및 학습 자원 링크
  final String description = 'Unity는 강력한 크로스 플랫폼 게임 개발 엔진입니다. '
      '2D, 3D, AR, VR 게임을 비롯한 다양한 인터랙티브 콘텐츠를 개발할 수 있습니다.';
  final String unityOfficial = 'https://unity.com/';
  final String unityLearn = 'https://learn.unity.com/';
  final String unityGitHub = 'https://github.com/Unity-Technologies';

  const UnityDescriptionPage({super.key});

  get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unity 엔진에 대하여'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 20.0),
            _buildButton('공식 웹사이트 방문', unityOfficial),
            _buildButton('Learn Unity', unityLearn),
            _buildButton('GitHub 페이지 방문', unityGitHub),
          ],
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
            icon: Icon(Icons.list),
            label: 'Resources',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pop();
              break;
            case 1:
              Navigator.popUntil(context, ModalRoute.withName('/'));
              break;
            case 2:
              Navigator.pushNamed(context, '/resourceLink');
              break;
          }
        },
      ),
    );
  }

  Widget _buildButton(String text, String url) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () => _launchURL(url, context as BuildContext),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  void _launchURL(String url, BuildContext context) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('링크를 열 수 없습니다: $url')),
      );
    }
  }
}

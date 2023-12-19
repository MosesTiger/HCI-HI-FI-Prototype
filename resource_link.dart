import 'package:flutter/material.dart';
import 'unity_description.dart';

class ResourceLinkPage extends StatelessWidget {
  const ResourceLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('자료'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: const Text('엔진: UNITY', style: TextStyle(color: Colors.white)),
                  tileColor: Colors.blue,
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, '/unityDescription');
                  },
                ),
                ListTile(
                  title: const Text('에니메이터', style: TextStyle(color: Colors.white)),
                  tileColor: Colors.blue,
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  onTap: () {
                    // 에니메이터 페이지로 이동하는 코드를 여기에 추가합니다.
                  },
                ),
                ListTile(
                  title: const Text('개발언어', style: TextStyle(color: Colors.white)),
                  tileColor: Colors.blue,
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  onTap: () {
                    // 개발언어 페이지로 이동하는 코드를 여기에 추가합니다.
                  },
                ),
                ListTile(
                  title: const Text('3D 모델', style: TextStyle(color: Colors.white)),
                  tileColor: Colors.blue,
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  onTap: () {
                    // 3D 모델 페이지로 이동하는 코드를 여기에 추가합니다.
                  },
                ),
                ListTile(
                  title: const Text('OST', style: TextStyle(color: Colors.white)),
                  tileColor: Colors.blue,
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  onTap: () {
                    // OST 페이지로 이동하는 코드를 여기에 추가합니다.
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_rounded),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pop();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResourceLinkPage(),
    routes: {
      '/unityDescription': (context) => UnityDescriptionPage(),
      // 기타 페이지 라우트들을 여기에 추가합니다.
    },
  ));
}

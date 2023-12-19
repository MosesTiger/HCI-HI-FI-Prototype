import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orandcle'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (1 / 0.6), // 넓은 버튼을 만들기 위한 비율
          children: <Widget>[
            _buildGridButton(context, "빌드", '/build', Colors.lightBlue),
            _buildGridButton(context, "로드맵", '/roadmap', Colors.lightBlue),
            _buildGridButton(context, "스택맵", '/stackMap', Colors.lightBlue),
            _buildGridButton(context, "자료", '/resourceLink', Colors.lightBlue),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: 'Next',
          ),
        ],
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String title, String routeName, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color, // 버튼 텍스트색
        shape: RoundedRectangleBorder( // 모서리를 둥글게
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, routeName),
      child: Text(title),
    );
  }
}

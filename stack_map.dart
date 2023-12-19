import 'package:flutter/material.dart';

class StackMapPage extends StatelessWidget {
  const StackMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Stack'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // 여기에 정보 표시 로직을 추가합니다.
              // 예를 들어, 다이얼로그를 표시하거나 새 페이지로 이동할 수 있습니다.
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: _buildStackItem(context, 'UNITY', '/unityDescription', Colors.blue),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(child: _buildStackItem(context, '애니메이터', '', Colors.green)),
                Expanded(child: _buildStackItem(context, '개발언어', '', Colors.yellow)),
                Expanded(child: _buildStackItem(context, '3D모델', '', Colors.orange)),
              ],
            ),
          ),
          Expanded(
            child: _buildStackItem(context, 'OST', '', Colors.red),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
          if (index == 0) {
            Navigator.of(context).pop();
          } else if (index == 1) {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          } else if (index == 2) {
            Navigator.pushNamed(context, '/resourceLink');
          }
        },
      ),
    );
  }

  Widget _buildStackItem(BuildContext context, String stackName, String route, Color color) {
    return GestureDetector(
      onTap: route.isNotEmpty
          ? () => Navigator.pushNamed(context, route)
          : null,
      child: Container(
        color: color,
        child: Center(
          child: Text(
            stackName,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

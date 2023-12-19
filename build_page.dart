import 'package:flutter/material.dart';
import 'stack_map.dart'; // 이 파일은 해당 경로에 존재해야 합니다.
import 'unity_description.dart'; // UnityDescriptionPage를 import합니다.

class BuildPage extends StatefulWidget {
  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  String selectedDevelopment = '게임'; // 기본값
  List<String> stackTitles = ['스택 1', '스택 2', '스택 3', '스택 4', '스택 5'];
  List<String> stackDescriptions = ['', '', '', '', '']; // 초기 스택 설명은 빈 문자열로 시작
  String userName = ""; // 사용자 이름

  // BottomNavigationBar에 사용할 현재 인덱스
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('빌드'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileImage(),
                  Expanded(
                    child: Column(
                      children: [
                        _buildNameInput(),
                        _buildDevelopmentDropdown(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildStackMapAndSaveButtons(),
            _buildStackBoxes(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Roadmap',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.of(context).pop();
          } else if (index == 1) {
            Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/roadmap');
          }
        },
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('assets/character.png'),
      ),
    );
  }

  Widget _buildNameInput() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          userName = value;
        });
      },
      decoration: InputDecoration(
        labelText: '이름 입력',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDevelopmentDropdown() {
    return DropdownButton<String>(
      value: selectedDevelopment,
      onChanged: (String? newValue) {
        setState(() {
          selectedDevelopment = newValue!;
          updateStackDescriptions(newValue);
        });
      },
      items: <String>['게임', '웹페이지', '애플리케이션']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void updateStackDescriptions(String developmentType) {
    // 선택된 개발 유형에 따라 스택 설명을 업데이트합니다.
    if (developmentType == '게임') {
      stackDescriptions = ['엔진: UNITY', '애니메이터', '개발언어', '3D 모델', 'OST'];
    } else {
      // 다른 개발 유형에 따른 설명을 여기에 설정할 수 있습니다.
      stackDescriptions = ['', '', '', '', ''];
    }
  }

  Widget _buildStackMapAndSaveButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StackMapPage()), // StackMap 페이지로 이동
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('스택맵'),
        ),
        ElevatedButton(
          onPressed: () {
            // '저장' 버튼 로직을 여기에 추가하세요.
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('저장'),
        ),
      ],
    );
  }

  Widget _buildStackBoxes() {
    return Expanded(
      child: ListView.builder(
        itemCount: stackTitles.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // "엔진: UNITY"가 선택되었을 때 UnityDescriptionPage로 이동
                if (stackDescriptions[index] == '엔진: UNITY') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UnityDescriptionPage(), // description 파라미터 제거
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('${stackTitles[index]} - ${stackDescriptions[index]}'),
            ),
          );
        },
      ),
    );
  }
}

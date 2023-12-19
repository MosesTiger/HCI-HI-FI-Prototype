import 'package:flutter/material.dart';

// 선택 가능한 기술 스택을 나타내는 클래스
class StackOption {
  final String name;
  final String description;

  StackOption({required this.name, required this.description});
}

class StackSelection extends StatefulWidget {
  const StackSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StackSelectionState createState() => _StackSelectionState();
}

class _StackSelectionState extends State<StackSelection> {
  // 가상의 기술 스택 옵션 데이터
  final List<StackOption> options = [
    StackOption(name: 'Unity', description: '게임 개발을 위한 크로스 플랫폼 엔진'),
    StackOption(name: 'Unreal Engine', description: '고품질의 3D 게임 개발을 위한 엔진'),
    StackOption(name: 'Flutter', description: '크로스 플랫폼 모바일 애플리케이션 개발 프레임워크'),
    // 추가 옵션을 여기에 정의할 수 있습니다.
  ];

  String? _selectedStack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기술 스택 선택')),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(options[index].name),
            subtitle: Text(options[index].description),
            trailing: Radio<String>(
              value: options[index].name,
              groupValue: _selectedStack,
              onChanged: (String? value) {
                setState(() {
                  _selectedStack = value;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 선택된 기술 스택에 따라 다른 페이지로 이동 또는 액션 수행
          if (_selectedStack != null) {
            Navigator.pushNamed(context, '/selectedStackDetails', arguments: _selectedStack);
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

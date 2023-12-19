import 'package:flutter/material.dart';
import 'roadmap.dart';
import 'comparison_page.dart';
import 'unity_description.dart';

class EngineSelectionScreen extends StatefulWidget {
  const EngineSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EngineSelectionScreenState createState() => _EngineSelectionScreenState();
}

class _EngineSelectionScreenState extends State<EngineSelectionScreen> {
  final Map<String, bool> _selectedEngines = {
    'UNITY': false,
    'UNREAL': false,
    'GOBOT': false,
    'CryEngine': false,
  };

  void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _goToComparison() {
    final selectedEngines = _selectedEngines.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedEngines.length > 1) {
      _navigateToPage(ComparisonPage(selectedEngines: selectedEngines));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("두 개 이상의 엔진을 선택해야 비교할 수 있습니다."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedCount = _selectedEngines.values.where((isSelected) => isSelected).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('엔진 선택'),
        centerTitle: true,
      ),
      body: ListView(
        children: _selectedEngines.keys.map((engineName) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ListTile(
              title: Text(engineName),
              trailing: Checkbox(
                value: _selectedEngines[engineName],
                onChanged: (bool? newValue) {
                  setState(() {
                    _selectedEngines[engineName] = newValue!;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _selectedEngines[engineName] = !_selectedEngines[engineName]!;
                });
              },
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (selectedCount == 1) ...[
              TextButton(
                onPressed: () => _navigateToPage(RoadmapPage(developmentType: _selectedEngines.entries.firstWhere((entry) => entry.value).key, selectedEngine: '',)),
                child: Text('선택', style: TextStyle(color: Colors.white)),
              ),
            ],
            if (selectedCount == 1 && _selectedEngines['UNITY'] == true) ...[
              TextButton(
                onPressed: () => _navigateToPage(UnityDescriptionPage()),
                child: Text('더 알아보기', style: TextStyle(color: Colors.white)),
              ),
            ],
            if (selectedCount > 1 ) ...[
              TextButton(
                onPressed: _goToComparison,
                child: Text('비교', style: TextStyle(color: Colors.white)),
              ),
            ],
            TextButton(
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
              child: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

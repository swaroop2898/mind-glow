import 'package:flutter/material.dart';
import '../../core/widgets/common_widgets.dart';
import '../widget/dashboard_item.dart';
import '../widget/quizList.dart';
import 'HomeScreen.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage(this.name, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      QuizList(widget.name),
      HomeScreen(widget.name),
      const ActivityItem(),
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple.shade50,
        appBar: appBarAndBackButton(
            _selectedIndex == 0
                ? "Quick Quiz"
                : _selectedIndex == 1
                    ? "Home"
                    : "Activity",
            context,
            true,
            true),
        body: SafeArea(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz_outlined),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_run),
              label: 'Activity',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

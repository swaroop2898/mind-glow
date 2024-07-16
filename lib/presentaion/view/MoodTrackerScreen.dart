import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/provider/moodProvider.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

  @override
  MoodTrackerScreenState createState() => MoodTrackerScreenState();
}

class MoodTrackerScreenState extends State<MoodTrackerScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoodProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Mood Tracker')),
        body: Consumer<MoodProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.moods.length,
                    itemBuilder: (context, index) {
                      final mood = provider.moods[index];
                      return ListTile(
                        title: Text(
                          mood.mood,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        subtitle: Text(
                          mood.timestamp.toLocal().toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Most Frequent Mood: ${provider.mostFrequentMood}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                labelText: 'How are you feeling?',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.add, color: Colors.blueAccent),
                            onPressed: () {
                              if (_controller.text.isNotEmpty) {
                                Provider.of<MoodProvider>(context,
                                        listen: false)
                                    .addMood(_controller.text);
                                _controller.clear();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../Model/moodModel.dart';


class MoodProvider extends ChangeNotifier {
  final List<Mood> _moods = [];

  List<Mood> get moods => _moods;

  void addMood(String mood) {
    _moods.add(Mood(mood: mood, timestamp: DateTime.now()));
    notifyListeners();
  }

  String get mostFrequentMood {
    if (_moods.isEmpty) return 'No mood entries yet';

    final Map<String, int> moodCount = {};

    for (var mood in _moods) {
      moodCount[mood.mood] = (moodCount[mood.mood] ?? 0) + 1;
    }

    return moodCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }
}
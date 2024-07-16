import 'package:flutter/material.dart';
import 'dart:math';

import '../../Model/challengeModel.dart';

class ChallengeProvider extends ChangeNotifier {
  final List<Challenge> _allChallenges = [
    Challenge(title: 'Meditation', description: 'Spend 10 minutes meditating.'),
    Challenge(title: 'Deep Breathing', description: 'Do 5 minutes of deep breathing exercises.'),
    Challenge(title: 'Gratitude Journal', description: 'Write down three things you are grateful for.'),
    Challenge(title: 'Act of Kindness', description: 'Do something kind for someone today.'),
    // Add more challenges here
  ];

  late Challenge _currentChallenge;

  Challenge get currentChallenge => _currentChallenge;

  ChallengeProvider() {
    _loadChallenge();
  }

  void _loadChallenge() {
    _currentChallenge = _allChallenges[Random().nextInt(_allChallenges.length)];
    notifyListeners();
  }

  void refreshChallenge() {
    _loadChallenge();
  }
}

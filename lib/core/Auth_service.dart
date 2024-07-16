import 'package:hive/hive.dart';


class AuthService {
  static const String _authBoxName = 'authBox';

  Future<void> setLoggedIn(bool loggedIn) async {
    final authBox = await Hive.openBox(_authBoxName);
    await authBox.put('loggedIn', loggedIn);
    await authBox.close();
  }

  Future<bool> isLoggedIn() async {
    final authBox = await Hive.openBox(_authBoxName);
    final bool? loggedIn = authBox.get('loggedIn');
    await authBox.close();
    return loggedIn ?? false;
  }

  Future<void> setUsername(String username) async {
    final authBox = await Hive.openBox(_authBoxName);
    await authBox.put('username', username);
    await authBox.close();
  }

  Future<String?> getUsername() async {
    final authBox = await Hive.openBox(_authBoxName);
    final String? username = authBox.get('username');
    await authBox.close();
    return username;
  }

  Future<void> setQuizResult(Map<String, dynamic> quizResult) async {
    final authBox = await Hive.openBox(_authBoxName);
    await authBox.put('quizResult', quizResult);
    await authBox.close();
  }

  Future<Map<String, dynamic>?> getQuizResult() async {
    final authBox = await Hive.openBox(_authBoxName);
    final Map<String, dynamic>? quizResult = authBox.get('quizResult');
    await authBox.close();
    return quizResult;
  }
}

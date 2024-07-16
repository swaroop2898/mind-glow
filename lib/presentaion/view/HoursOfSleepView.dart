import 'package:flutter/material.dart';
import 'package:mind_glow/presentaion/view/HomePage.dart';

import '../../Model/quiz_model.dart';
import '../../core/widgets/common_widgets.dart';

class HoursOfSleepView extends StatefulWidget {
  const HoursOfSleepView({super.key});

  @override
  State<HoursOfSleepView> createState() => _HoursOfSleepViewState();
}

class _HoursOfSleepViewState extends State<HoursOfSleepView> {
  final List<Question> _questions = [
    Question(
      text: "How many hours did you sleep?",
      options: [
        "0-3",
        "4-6",
        "7-9",
        "10-12",
      ],
    ),
  ];

  final Map<int, String?> _answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAndBackButton("Hours of sleep", context, true, false),
      body: Container(
        height: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _questions.length + 1,
            itemBuilder: (context, index) {
              if (index == _questions.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: _submitQuiz,
                    child: const Text("Submit"),
                  ),
                );
              }

              final question = _questions[index];
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}) ${question.text}",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    ...question.options.map((option) => RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: _answers[index],
                          onChanged: (value) {
                            setState(() {
                              _answers[index] = value;
                            });
                          },
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _submitQuiz() {
    if (_answers.length == _questions.length) {
      // All questions answered
      // Handle the answers, e.g., save to a database or send to an API
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Quiz Submitted"),
          content:
              Text("Your answers:\n${_questions.asMap().entries.map((entry) {
            int idx = entry.key;
            Question question = entry.value;
            return "${question.text}\nAnswer: ${_answers[idx]}";
          }).join("\n\n")}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                GlobalWidgets.navigateToNextScreen(context: context, widget: HomePage("name"));
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Incomplete Quiz"),
          content: const Text("Please answer all questions before submitting."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';

import '../../Model/quiz_model.dart';
import '../../core/widgets/common_widgets.dart';
import '../view/HomePage.dart';

class QuizList extends StatefulWidget {
final String  name;
  const QuizList(this.name,  {super.key});

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  final List<Question> _questions = [
    Question(
      text: "What made you feel happy today?",
      options: [
        "Spending time with family",
        "Achieving a personal goal",
        "Engaging in a hobby",
        "Receiving a compliment",
        "Helping someone in need",
      ],
    ),
    Question(
      text: "How would you rate your overall mood today?",
      options: [
        "Very Happy",
        "Happy",
        "Neutral",
        "Sad",
        "Very Sad",
      ],
    ),
    Question(
      text: "What is your favorite season?",
      options: [
        "Spring",
        "Summer",
        "Autumn",
        "Winter",
      ],
    ),
    Question(
      text: "Which type of music do you enjoy the most?",
      options: [
        "Pop",
        "Rock",
        "Jazz",
        "Classical",
        "Hip Hop",
      ],
    ),
    Question(
      text: "Which activity helps you relax the most?",
      options: [
        "Reading",
        "Listening to music",
        "Exercising",
        "Meditating",
      ],
    ),
    Question(
      text: "What is your favorite outdoor activity?",
      options: [
        "Hiking",
        "Cycling",
        "Swimming",
        "Picnicking",
      ],
    ),
    Question(
      text: "Which book genre do you prefer?",
      options: [
        "Fantasy",
        "Science Fiction",
        "Mystery",
        "Romance",
      ],
    ),
    Question(
      text: "What is your preferred method of travel?",
      options: [
        "Car",
        "Train",
        "Airplane",
        "Boat",
      ],
    ),
    Question(
      text: "What is your favorite food cuisine?",
      options: [
        "Italian",
        "Mexican",
        "Chinese",
        "Indian",
      ],
    ),
    Question(
      text: "Which movie genre do you enjoy watching the most?",
      options: [
        "Action",
        "Comedy",
        "Drama",
        "Thriller",
        "Animation",
      ],
    ),
    Question(
      text: "What do you like to do in your free time?",
      options: [
        "Cooking",
        "Gardening",
        "Playing video games",
        "Crafting",
      ],
    ),
    Question(
      text: "How do you prefer to start your day?",
      options: [
        "Yoga or meditation",
        "A healthy breakfast",
        "Morning exercise",
        "Checking emails",
      ],
    ),
    Question(
      text: "What is your favorite color?",
      options: [
        "Blue",
        "Red",
        "Green",
        "Yellow",
        "Purple",
      ],
    ),
    Question(
      text: "What is your dream vacation destination?",
      options: [
        "Beach resort",
        "Mountain retreat",
        "European city tour",
        "Tropical island",
      ],
    ),
    Question(
      text: "Which social media platform do you use the most?",
      options: [
        "Facebook",
        "Instagram",
        "Twitter",
        "LinkedIn",
        "TikTok",
      ],
    ),
    Question(
      text: "What is your favorite holiday?",
      options: [
        "Christmas",
        "Thanksgiving",
        "Easter",
        "Halloween",
      ],
    ),
    Question(
      text: "What type of pets do you like?",
      options: [
        "Cats",
        "Dogs",
        "Fish",
        "Birds",
      ],
    ),
    Question(
      text: "Which fictional universe would you want to live in?",
      options: [
        "Harry Potter",
        "Star Wars",
        "Marvel Universe",
        "Lord of the Rings",
      ],
    ),
    Question(
      text: "What is your favorite mode of entertainment?",
      options: [
        "Books",
        "Movies",
        "TV shows",
        "Video games",
      ],
    ),
    Question(
      text: "How do you like to spend a rainy day?",
      options: [
        "Reading a book",
        "Watching movies",
        "Cooking or baking",
        "Taking a nap",
      ],
    ),
  ];

  final Map<int, String?> _answers = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: double.maxFinite,
          child: ListView.builder(
            itemCount: _questions.length + 1,
            itemBuilder: (context, index) {
              if (index == _questions.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: (){
                      _submitQuiz(widget.name);
                    },
                    child: const Text("Submit"),
                  ),
                );
              }

              final question = _questions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
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
          )),
    );
  }

  void _submitQuiz(String name) {
    if (_answers.length == _questions.length) {
      GlobalWidgets.navigateToNextScreen(
          context: context, widget:  HomePage(name));
      // All questions answered
      // Handle the answers, e.g., save to a database or send to an API
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: const Text("Quiz Submitted"),
      //     content: Text("Your answers:\n${_questions.asMap().entries.map((entry) {
      //           int idx = entry.key;
      //           Question question = entry.value;
      //           return "${question.text}\nAnswer: ${_answers[idx]}";
      //         }).join("\n\n")}"),
      //     actions: [
      //       TextButton(
      //         onPressed: () => Navigator.of(context).pop(),
      //         child: const Text("OK"),
      //       ),
      //     ],
      //   ),
      // );
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

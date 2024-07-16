import 'package:flutter/material.dart';
import 'package:mind_glow/presentaion/widget/quizList.dart';
import '../../core/widgets/common_widgets.dart';

class QuizView extends StatefulWidget {
  final String name;
  const QuizView(this.name, {super.key});
  @override
  State<QuizView> createState() => _QuizView();
}

class _QuizView extends State<QuizView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAndBackButton("Quick Quiz", context, true, false),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: QuizList(widget.name),
      ),
    );
  }
}




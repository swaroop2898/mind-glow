import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/challengeProvider.dart';

class DailyChallengeScreen extends StatelessWidget {
  const DailyChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => ChallengeProvider(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Daily Mindfulness Challenge')),
          body: Consumer<ChallengeProvider>(
            builder: (context, provider, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade200, Colors.purple.shade200],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            scale: 4,
                            "asset/img_10.png",
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          provider.currentChallenge.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          provider.currentChallenge.description,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: provider.refreshChallenge,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue, backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0,
                            ),
                          ),
                          child: const Text(
                            'Get New Challenge',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

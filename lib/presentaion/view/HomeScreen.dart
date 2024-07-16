import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_glow/core/widgets/common_widgets.dart';
import 'package:mind_glow/presentaion/view/MoodTrackerScreen.dart';
import 'package:mind_glow/presentaion/view/communityView.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/dashboard_item.dart';
import 'MindfulNessChallange.dart';
import 'ResourceView.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  const HomeScreen(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/img_9.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Hello, $name!',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Welcome back to MindGlow.',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 150),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    GlobalWidgets.navigatePushToNextScreen(
                        context: context,
                        widget: const DailyChallengeScreen());
                  },
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.self_improvement,
                    title: 'Mindfulness',
                    color: Colors.orange,
                  ),
                ),
                InkWell(
                  onTap: () {
                    GlobalWidgets.navigatePushToNextScreen(
                        context: context,
                        widget: const MoodTrackerScreen());
                  },
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.track_changes,
                    title: 'Track Mood',
                    color: Colors.teal,
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchInBrowserView(
                        "https://www.verywellmind.com/what-are-emotions-2795178");
                  },
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.book,
                    title: 'Learn',
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    GlobalWidgets.navigatePushToNextScreen(
                        context: context,
                        widget: const Scaffold(body: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ActivityItem(),
                        )));
                  },
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.favorite,
                    title: 'Wellness Plan',
                    color: Colors.redAccent,
                  ),
                ),
                InkWell(
                  onTap: () {
                    GlobalWidgets.navigatePushToNextScreen(
                        context: context,
                        widget:  ResourcesScreen());
                  },
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.library_books,
                    title: 'Resources',
                    color: Colors.blueAccent,
                  ),
                ),
                InkWell(
                  onTap: () {
                    GlobalWidgets.navigatePushToNextScreen(
                        context: context,
                        widget: const CommunityView());
                  },
                  child: _buildFeatureCard(
                    context,
                    icon: Icons.group,
                    title: 'Community',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon, required String title, required Color color}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> launchInBrowserView(String urlString) async {
  Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}

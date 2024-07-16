import 'package:flutter/material.dart';
import 'package:mind_glow/core/widgets/common_widgets.dart';
import 'package:provider/provider.dart';
import '../../Model/communityModel.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DiscussionProvider(),
      child: const DiscussionGroupScreen(),
    );
  }
}

class DiscussionProvider extends ChangeNotifier {
  final List<DiscussionGroup> _groups = [
    DiscussionGroup(name: 'Mental Health', posts: []),
    DiscussionGroup(name: 'Stress Management', posts: []),
    DiscussionGroup(name: 'Emotional Well-being', posts: []),
  ];

  List<DiscussionGroup> get groups => _groups;

  void addPost(String groupName, Post post) {
    final group = _groups.firstWhere((group) => group.name == groupName);
    group.posts.add(post);
    notifyListeners();
  }
}

class DiscussionGroupScreen extends StatelessWidget {
  const DiscussionGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Support')),
      body: Consumer<DiscussionProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.groups.length,
            itemBuilder: (context, index) {
              final group = provider.groups[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: customButton(
                  text: group.name,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscussionDetailScreen(group: group),
                    ),
                  ),
                  width: double.maxFinite,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DiscussionDetailScreen extends StatefulWidget {
  final DiscussionGroup group;

  const DiscussionDetailScreen({super.key, required this.group});

  @override
  DiscussionDetailScreenState createState() => DiscussionDetailScreenState();
}

class DiscussionDetailScreenState extends State<DiscussionDetailScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.group.name)),
      body: Column(
        children: [
          Expanded(
            child: Consumer<DiscussionProvider>(
              builder: (context, provider, child) {
                final group = provider.groups
                    .firstWhere((g) => g.name == widget.group.name);
                return ListView.builder(
                  itemCount: group.posts.length,
                  itemBuilder: (context, index) {
                    final post = group.posts[index];
                    return ListTile(
                      title: Text(post.username),
                      subtitle: Text(post.content),
                      trailing: Text(post.timestamp.toIso8601String()),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Share your experience',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      final post = Post(
                        username: 'Swaroop',
                        content: _controller.text,
                        timestamp: DateTime.now(),
                      );
                      Provider.of<DiscussionProvider>(context, listen: false)
                          .addPost(widget.group.name, post);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Post {
  final String username;
  final String content;
  final DateTime timestamp;

  Post({required this.username, required this.content, required this.timestamp});
}

class DiscussionGroup {
  final String name;
  final List<Post> posts;

  DiscussionGroup({required this.name, required this.posts});
}

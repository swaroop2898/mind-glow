class Resource {
  final String title;
  final ResourceType type;
  final String source;
  final String url;

  Resource({
    required this.title,
    required this.type,
    required this.source,
    required this.url,
  });
}

enum ResourceType { article, video, podcast }
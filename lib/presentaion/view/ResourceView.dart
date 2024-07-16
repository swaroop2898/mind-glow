import 'package:flutter/material.dart';
import 'package:mind_glow/core/widgets/common_widgets.dart';
import 'package:mind_glow/presentaion/view/videoView.dart';

import '../../Model/ResourceModel.dart';

class ResourcesScreen extends StatelessWidget {
  final List<Resource> resources = [
    Resource(
      title: 'Managing Stress',
      type: ResourceType.article,
      source: 'Verywell Mind',
      url: 'https://www.verywellmind.com/managing-stress-12345',
    ),
    Resource(
      title: 'Understanding Emotions',
      type: ResourceType.video,
      source: 'YouTube',
      url: 'https://www.youtube.com/watch?v=example',
    ),
    Resource(
      title: 'Improving Sleep Quality',
      type: ResourceType.podcast,
      source: 'Spotify',
      url: 'https://www.spotify.com/podcast/example',
    ),
  ];

  ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Resources'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final resource = resources[index];
          return ResourceCard(resource: resource);
        },
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final Resource resource;

  const ResourceCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          GlobalWidgets.navigateToNextScreen(
              context: context, widget: const VideoListScreen());
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                resource.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(resource.type == ResourceType.article
                      ? Icons.article
                      : resource.type == ResourceType.video
                          ? Icons.video_library
                          : Icons.podcasts),
                  const SizedBox(width: 10),
                  Text(
                    resource.source,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                resource.url,
                style: const TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

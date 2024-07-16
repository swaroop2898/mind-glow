import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:mind_glow/shared/main_failure.dart';

import '../../Model/videoModel.dart';
import '../../data/Api_repo.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late Future<dartz.Either<MainFailure, List<Video>>> futureVideos;

  @override
  void initState() {
    super.initState();
    final apiService = ApiRepository();
    futureVideos = apiService.fetchVideoFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
      ),
      body: FutureBuilder<dartz.Either<MainFailure, List<Video>>>(
        future: futureVideos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No videos found'));
          } else {
            return snapshot.data!.fold(
                  (failure) => Center(child: Text('Error: ${failure.toString()}')),
                  (videos) => ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(video.thumbnailUrl),
                      title: Text(video.title),
                      onTap: () {
                        // Handle video tap
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}


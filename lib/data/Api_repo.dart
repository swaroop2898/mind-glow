import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:mind_glow/Model/videoModel.dart';

import '../Hive/db.dart';
import '../domain/helpdesk.dart';
import '../shared/main_failure.dart';
import 'ApiService.dart';

@LazySingleton(as: ApiService)
class ApiRepository implements ApiService {
  @override
  Future<Either<MainFailure, List<Video>>> fetchVideoFromLocal() async {
    try {
      final eventListIterable = await getAllVideos();
      final videoList = eventListIterable.map((e) => e).toList();
      if (kDebugMode) {
        print("swaroop $videoList");
      }
      return Right(videoList);
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<Video>>> fetchVideoFromServer() async {
    try {
      const String baseUrl = 'https://jsonplaceholder.typicode.com';

      final Response response = await Dio().get('$baseUrl/photos');

      if (response.statusCode == 200) {
        List<dynamic> body = response.data;

        final videoDb = await Hive.openBox<Video>('Helpdesk1');
        await videoDb.clear();

        List<Video> videoList = body.map((e) {
          final video = Video.fromJson(e as Map<String, dynamic>);
          videoDb.add(video);
          return video;
        }).toList();

        print(videoList);
        await getAllVideos();
        await videoDb.close();
        return Right(videoList);
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception : $e');
      }
      return const Left(MainFailure.clientFailure());
    }
  }

}


import 'package:hive/hive.dart';

import '../Model/videoModel.dart';

Future<Iterable<Video>> getAllVideos() async {
  final videoDb = await Hive.openBox<Video>('Helpdesk1');
  return videoDb.values;
}
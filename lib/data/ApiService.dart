import 'package:dartz/dartz.dart';
import '../Model/videoModel.dart';
import '../shared/main_failure.dart';

abstract class ApiService {
  Future<Either<MainFailure, List<Video>>> fetchVideoFromServer();
  Future<Either<MainFailure, List<Video>>> fetchVideoFromLocal();
}
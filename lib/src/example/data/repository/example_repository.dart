import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/example/data/remote/responses/post_response.dart';

abstract class ExampleRepository {
  FutureOrError<List<PostResponse>> getPosts();
}

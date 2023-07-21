import 'package:bloc_skeleton/core/domain/models/error_dto.dart';
import 'package:either_dart/either.dart';

typedef EitherError<T> = Either<ErrorDto, T>;

typedef FutureOrError<T> = Future<EitherError<T>>;

typedef BooleanCallback = void Function(bool);

typedef IntCallback = void Function(int);

typedef StringCallback = void Function(String);
typedef StringIntCallback = void Function(String, int);
typedef StringStringCallback = void Function(String, String);
typedef StringListStringCallback = void Function(String, List<String>);
// typedef ArticleCallback = void Function(ArticleDto);

// typedef EventCallback = void Function(EventDto);


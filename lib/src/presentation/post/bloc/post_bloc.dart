import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture/src/core/failure.dart';
import 'package:clean_architecture/src/domain/post.dart';
import 'package:clean_architecture/src/domain/usecases/get_post_by_id.dart';
import 'package:dartz/dartz.dart';
import './bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostById getPostById;

  PostBloc(this.getPostById);

  @override
  PostState get initialState => Empty();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is GetPostByIdEvent) {
      var failureOrPost =
          await getPostById(GetPostByIdParams(id: event.params.id));
      yield* _eitherLoadedOrErrorState(failureOrPost);
    }
  }

  Stream<PostState> _eitherLoadedOrErrorState(
    Either<Failure, Post> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => Error(message: ""),
      (post) => LoadedState([post]),
    );
  }
}

import 'package:clean_architecture/src/domain/post.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class Empty extends PostState {
  @override
  List<Object> get props => [];
}

class Loading extends PostState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PostState {
  final List<Post> posts;

  LoadedState(this.posts);

  @override
  List<Object> get props => [];
}

class Error extends PostState {
  final String message;

  Error({this.message});

  @override
  List<Object> get props => [message];
}

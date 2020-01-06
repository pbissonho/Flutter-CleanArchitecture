import 'package:clean_architecture/src/domain/usecases/get_post_by_id.dart';
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class GetPostByIdEvent extends PostEvent {
  final GetPostByIdParams params;

  GetPostByIdEvent(this.params);
  @override
  List<Object> get props => [params];
}
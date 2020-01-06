import 'package:clean_architecture/src/presentation/post/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:koin/koin.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> with InjectComponent {
  Lazy<PostBloc> postBloc;

  @override
  void initState() {
    postBloc = inject<PostBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<PostState>(
        stream: postBloc(),
        builder: (BuildContext context, AsyncSnapshot<PostState> snapshot) {
          var data = snapshot.data;
          if (data is LoadedState) {
            return Center(child: Text(data.posts[0].title));
          }
          return Container();
        },
      ),
    );
  }
}

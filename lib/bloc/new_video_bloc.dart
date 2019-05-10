import 'package:minecraft_videos/bloc/base_bloc.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:rxdart/rxdart.dart';

class NewVideoBloc extends BaseBloc {
  final newVideosFetcher = PublishSubject<List<VidModel>>();

  Observable<List<VidModel>> get getNewVideoList => newVideosFetcher.stream;

  getNewVideo() async {
    List<VidModel> videoList = await repository.getNewVideos();
    newVideosFetcher.sink.add(videoList);
  }

  @override
  dispose() {
    newVideosFetcher.close();
    return super.dispose();
  }
}

final videoListBloc = NewVideoBloc();

import 'package:minecraft_videos/bloc/base_bloc.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:rxdart/rxdart.dart';

class VideoByCategoryBloc extends BaseBloc {
  final videoByCategoryFetcher = PublishSubject<List<VidModel>>();

  Observable<List<VidModel>> get getVideoByCategoryList =>
      videoByCategoryFetcher.stream;

  getVideoByCategory(String cid) async {
    List<VidModel> videoList = await repository.getVideosByCategory(cid);
    videoByCategoryFetcher.sink.add(videoList);
  }

  @override
  dispose() {
    videoByCategoryFetcher.close();
    return super.dispose();
  }
}

final videoByCategoryBloc = VideoByCategoryBloc();

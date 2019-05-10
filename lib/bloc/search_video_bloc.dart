import 'package:minecraft_videos/bloc/base_bloc.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:rxdart/rxdart.dart';

class SearchVideoBloc extends BaseBloc {
  final searchVideofetcher = PublishSubject<List<VidModel>>();

  Observable<List<VidModel>> get searchVideoList => searchVideofetcher.stream;

  getSearchVideo(String query) async {
    List<VidModel> videoList = await repository.getVideoByKeyword(query);
    searchVideofetcher.sink.add(videoList);
  }

  @override
  dispose() {
    searchVideofetcher.close();
    return super.dispose();
  }
}

final searchVideoBloc = SearchVideoBloc();

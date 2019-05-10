import 'package:minecraft_videos/bloc/base_bloc.dart';
import 'package:minecraft_videos/model/category_model.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc extends BaseBloc {
  final categoryFetcher = PublishSubject<List<CatVideos>>();

  Observable<List<CatVideos>> get getCategoryList => categoryFetcher.stream;

  getCategory() async {
    List<CatVideos> videoList = await repository.getCategories();
    categoryFetcher.sink.add(videoList);
  }

  @override
  dispose() {
    categoryFetcher.close();
    return super.dispose();
  }
}

final categoryBloc = CategoryBloc();

import 'package:minecraft_videos/model/category_model.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:minecraft_videos/res/api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<List<VidModel>> getNewVideos() => apiProvider.getNewVideo();

  Future<List<VidModel>> getVideosByCategory(String cid) => apiProvider.getVideosByCategory(cid);

  Future<List<VidModel>> getVideoByKeyword(String query) => apiProvider.getVideoByKeyword(query);

  Future<List<CatVideos>> getCategories() => apiProvider.getCategories();
}

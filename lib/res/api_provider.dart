import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minecraft_videos/api/api_url.dart';
import 'package:minecraft_videos/model/category_model.dart';
import 'package:minecraft_videos/model/video_model.dart';

class ApiProvider {
  Future<List<VidModel>> getNewVideo() async {
    final res = await http.get(getNewVideos);
    if (res.statusCode == 200) {
      print(res.request.url.toString());
      return compute(vidModelFromJson, res.body);
    } else {
      throw Exception('Failed to get videos');
    }
  }

  Future<List<VidModel>> getVideosByCategory(String cid) async {
    final res = await http.get(getVideosBycategory + '$cid');
    if (res.statusCode == 200) {
      print(res.request.url.toString());
      return compute(vidModelFromJson, res.body);
    } else {
      throw Exception('Failed to get Videos');
    }
  }

  Future<List<CatVideos>> getCategories() async {
    final res = await http.get(getCategory);
    if (res.statusCode == 200) {
      print(res.request.url.toString());
      return compute(catVideosFromJson, res.body);
    } else {
      throw Exception('Failed to get Category');
    }
  }

  Future<List<VidModel>> getVideoByKeyword(String query) async {
    final res = await http.get(getVideosByKeyword + '$query');
    if (res.statusCode == 200) {
      print(res.request.url.toString());
      return compute(vidModelFromJson, res.body);
    } else {
      throw Exception('Failed to get Videos');
    }
  }
}

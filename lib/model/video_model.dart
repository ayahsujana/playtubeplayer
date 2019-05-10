import 'dart:convert';

List<VidModel> vidModelFromJson(String str) => new List<VidModel>.from(json.decode(str).map((x) => VidModel.fromJson(x)));

String vidModelToJson(List<VidModel> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class VidModel {
    String id;
    String catId;
    String videoTitle;
    String videoUrl;
    String videoId;
    String videoThumbnail;
    String videoDuration;
    String videoDescription;
    String videoType;
    String categoryName;
    String categoryImage;

    VidModel({
        this.id,
        this.catId,
        this.videoTitle,
        this.videoUrl,
        this.videoId,
        this.videoThumbnail,
        this.videoDuration,
        this.videoDescription,
        this.videoType,
        this.categoryName,
        this.categoryImage,
    });

    factory VidModel.fromJson(Map<String, dynamic> json) => new VidModel(
        id: json["id"],
        catId: json["cat_id"],
        videoTitle: json["video_title"],
        videoUrl: json["video_url"],
        videoId: json["video_id"],
        videoThumbnail: json["video_thumbnail"],
        videoDuration: json["video_duration"],
        videoDescription: json["video_description"],
        videoType: json["video_type"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "video_title": videoTitle,
        "video_url": videoUrl,
        "video_id": videoId,
        "video_thumbnail": videoThumbnail,
        "video_duration": videoDuration,
        "video_description": videoDescription,
        "video_type": videoType,
        "category_name": categoryName,
        "category_image": categoryImage,
    };
}

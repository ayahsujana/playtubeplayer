import 'dart:convert';

List<CatVideos> catVideosFromJson(String str) => new List<CatVideos>.from(json.decode(str).map((x) => CatVideos.fromJson(x)));

String catVideosToJson(List<CatVideos> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class CatVideos {
    String cid;
    String categoryName;
    String categoryImage;

    CatVideos({
        this.cid,
        this.categoryName,
        this.categoryImage,
    });

    factory CatVideos.fromJson(Map<String, dynamic> json) => new CatVideos(
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
    );

    Map<String, dynamic> toJson() => {
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
    };
}
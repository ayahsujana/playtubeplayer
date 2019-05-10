import 'package:flutter/material.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:minecraft_videos/screen/detail/detail_video.dart';

Widget buildNewVideos(BuildContext context, List<VidModel> video) {
  return Container(
    child: ListView.builder(
      itemCount: video.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        var nv = video[index];
        return _buildNewVideos(context, nv);
      },
    ),
  );
}

Widget _buildNewVideos(BuildContext context, VidModel nv) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (_) => DetailPlayerVideo(nv)
      )),
      child: Container(
        width: double.infinity,
        height: 190.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: FadeInImage(
            image: NetworkImage(
                "https://img.youtube.com/vi/" + nv.videoId + "/0.jpg"),
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/images/loading.gif'),
          ),
        ),
      ),
    ),
  );
}

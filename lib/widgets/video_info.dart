// flutter
import 'package:flutter/material.dart';

// plugins
import 'package:timeago/timeago.dart' as timeago;

// youtube_clone models
import '../model/video.dart';

// youtube_clone widgets
import './actions_row.dart';
import './author_info.dart';

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            '${video.viewCount} views • ${timeago.format(video.timestamp)}',
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14.0),
          ),
          const Divider(),
          ActionsRow(video: video),
          const Divider(),
          AuthorInfo(user: video.author),
          const Divider(),
        ],
      ),
    );
  }
}

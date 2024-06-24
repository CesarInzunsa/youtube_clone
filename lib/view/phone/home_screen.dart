// flutter
import 'package:flutter/material.dart';

// youtube_clone widgets
import '../../widgets/widgets.dart';
import '../../controller/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: Data.videos.length,
                (context, index) {
                  final video = Data.videos[index];
                  return VideoCard(video: video);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

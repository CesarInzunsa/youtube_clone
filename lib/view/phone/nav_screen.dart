// flutter
import 'package:flutter/material.dart';

// plugins
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/view/phone/video_details.dart';

// youtube_clone screens
import '../../controller/data.dart';
import '../../model/video.dart';
import './home_screen.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight = 60.0;
  int _selectedIndex = 0;

  final _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text(
            'This feature is not available, because this is an example project.'),
      ),
    ),
    const HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text(
            'This feature is not available, because this is an example project.'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, watch, _) {
        final selectedVideo = watch(selectedVideoProvider).state;
        final miniPlayerController = watch(miniPlayerControllerProvider).state;
        return Stack(
          children: _screens
              .asMap()
              .map(
                (i, screen) => MapEntry(
                  i,
                  Offstage(offstage: _selectedIndex != i, child: screen),
                ),
              )
              .values
              .toList()
            ..add(
              Offstage(
                offstage: selectedVideo == null,
                child: Miniplayer(
                  controller: miniPlayerController,
                  minHeight: _playerMinHeight,
                  maxHeight: MediaQuery.of(context).size.height,
                  builder: (height, percentage) {
                    if (selectedVideo == null) {
                      return const SizedBox.shrink();
                    }
                    if (height <= _playerMinHeight + 50.0) {
                      return _videoMiniPlayer(selectedVideo);
                    } else {
                      return const VideoDetails();
                    }
                  },
                ),
              ),
            ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                foregroundImage: NetworkImage(Data.currentUser.profileImageUrl), radius: 12.0),
            // para el icono de usuario cuando sea seleccionado, agrega un borde alrededor del avatar de color negro
            activeIcon: CircleAvatar(
              radius: 12.0, // tamaño del borde
              backgroundColor: Colors.white, // color del borde
              child: CircleAvatar(
                radius: 10.0, // tamaño del avatar
                foregroundImage: NetworkImage(Data.currentUser.profileImageUrl),
              ),
            ),
            label: 'You',
          ),
        ],
      ),
    );
  }

  Widget _videoMiniPlayer(Video selectedVideo){
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                selectedVideo.thumbnailUrl,
                height: _playerMinHeight - 4.0,
                width: 120.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          selectedVideo.title,
                        ),
                      ),
                      Flexible(
                        child: Text(
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            selectedVideo.author.username),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  context.read(selectedVideoProvider).state =
                  null;
                },
              ),
            ],
          ),
          const LinearProgressIndicator(
            value: 0.4,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ],
      ),
    );
  }
}

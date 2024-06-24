import '../model/user.dart';
import '../model/video.dart';

class Data {
  static const User currentUser = User(
    username: 'Cesar Inzunsa',
    profileImageUrl:
        'https://media.licdn.com/dms/image/D4E03AQHbWDlTQo84Mw/profile-displayphoto-shrink_400_400/0/1692920453795?e=1724284800&v=beta&t=ipgS9p7Y2qz5sEi8O2mxuvVVw-r3qxggMnKvQfd1NAc',
    subscribers: '1M',
  );

  static final List<Video> videos = [
    Video(
      id: 'qzLsX8qM0LU',
      author: currentUser,
      title: '¿Cómo se diseña un componente en Java y cómo una biblioteca?',
      thumbnailUrl:
          'https://i9.ytimg.com/vi_webp/qzLsX8qM0LU/maxresdefault.webp?v=61723e39&sqp=CIT14rMG&rs=AOn4CLBqXPOtu8Ji4Is-27guZaDc1NIEsA',
      duration: '18:33',
      timestamp: DateTime(2021, 10, 21),
      viewCount: '133K',
      likes: '44K',
      dislikes: '0',
    ),
    Video(
      id: 'WVGuuDTjlQY',
      author: currentUser,
      title: 'MongoDB Atlas',
      thumbnailUrl:
          'https://i9.ytimg.com/vi/DD_fjeovG4w/maxresdefault.jpg?v=61a6f890&sqp=CLD34rMG&rs=AOn4CLD60A3Gb0X-cJNDYTzg04DXgZG02Q',
      duration: '05:33',
      timestamp: DateTime(2022, 11, 30),
      viewCount: '330K',
      likes: '11K',
      dislikes: '2',
    ),
    Video(
      id: 'Q69Gk_5tlpI',
      author: currentUser,
      title: 'Explicación sobre RECORRIDOS',
      thumbnailUrl:
      'https://i9.ytimg.com/vi/Q69Gk_5tlpI/sddefault.jpg?v=60c17a4b&sqp=CLD34rMG&rs=AOn4CLDOriItZqco-5RBKudkJ74eq91DoA',
      duration: '08:02',
      timestamp: DateTime(2021, 06, 09),
      viewCount: '500K',
      likes: '654K',
      dislikes: '444',
    ),
  ];

  static final List<Video> suggestedVideos = [
    Video(
      id: 'xks52yE7Vds',
      author: currentUser,
      title: 'Explicación de RUNNABLE',
      thumbnailUrl:
          'https://i9.ytimg.com/vi/xks52yE7Vds/maxresdefault.jpg?v=6191d513&sqp=CNz54rMG&rs=AOn4CLCIb6evAeVHFwDzeQilRghqvbXd2w',
      duration: '13:00',
      timestamp: DateTime(2021, 11, 14),
      viewCount: '100K',
      likes: '743K',
      dislikes: '333',
    ),
    Video(
      id: 'JD-Wl2_6qg0',
      author: currentUser,
      title: 'Firebase',
      thumbnailUrl:
      'https://i9.ytimg.com/vi/JD-Wl2_6qg0/sddefault.jpg?v=662d8b4c&sqp=CNz54rMG&rs=AOn4CLAYCDmUSYWHssGcIAvJRxa9b8v8bA',
      duration: '25:44',
      timestamp: DateTime(2021, 04, 27),
      viewCount: '374K',
      likes: '787K',
      dislikes: '425',
    ),
    Video(
      id: 'bcd3ZmdBLqw',
      author: currentUser,
      title: 'Línea de tiempo IoT',
      thumbnailUrl:
      'https://i9.ytimg.com/vi_webp/bcd3ZmdBLqw/sddefault.webp?v=66272c7f&sqp=CNz54rMG&rs=AOn4CLDdoqyWKfw0_V6OcbmWgplaQQYdoA',
      duration: '07:32',
      timestamp: DateTime(2024, 04, 22),
      viewCount: '874K',
      likes: '974K',
      dislikes: '46',
    ),
  ];
}

class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Marcus Ng',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
    thumbnailUrl:
        'https://tse2.mm.bing.net/th?id=OIP.RTSpv7BOzC9ofRYVhzMyXQHaE7&pid=Api&P=0&h=180',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '1k',
    dislikes: '45',
  ),
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title:
        'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture',
    thumbnailUrl:
        'https://tse2.mm.bing.net/th?id=OIP.wzlLPKvuy7CxZZkMzrS20AHaEK&pid=Api&P=0&h=180',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '67k',
    dislikes: '8k',
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Chhota Bheem | Cartoons for Kids | Funny Kids Video',
    thumbnailUrl:
        'https://tse2.mm.bing.net/th?id=OIP.5SWZeiNjE4AH00ZZneylxAHaEK&pid=Api&P=0&h=180',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Chhota Bheem | Cartoons for Kids | Funny Kids Video',
    thumbnailUrl:
        'https://tse3.mm.bing.net/th?id=OIP.xe2v890qktiiISdj4IbD1gHaEK&pid=Api&P=0&h=180',
    duration: '3:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '100K',
    likes: '58k',
    dislikes: '4k',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Chhota Bheem | Cartoons for Kids | Funny Kids Video',
    thumbnailUrl:
        'https://tse4.mm.bing.net/th?id=OIP.CjP2BjU1WsvxbFCWsBluJwHaFV&pid=Api&P=0&h=180',
    duration: '2:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '456K',
    likes: '98k',
    dislikes: '34k',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Chhota Bheem | Cartoons for Kids | Funny Kids Video',
    thumbnailUrl:
        'https://tse1.explicit.bing.net/th?id=OIP.hV56BStUlqvaNDFoDwo5kAHaFj&pid=Api&P=0&h=180',
    duration: '10:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10M',
    likes: '2M',
    dislikes: '4',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Chhota Bheem | Cartoons for Kids | Funny Kids Video',
    thumbnailUrl:
        'https://www.newszii.com/wp-content/uploads/2016/09/Science-Fiction-Movies_v29.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '100K',
    likes: '95K',
    dislikes: '4',
  ),
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Chhota Bheem | Cartoons for Kids | Funny Kids Video',
    thumbnailUrl:
        'https://www.newszii.com/wp-content/uploads/2016/09/Science-Fiction-Movies_v24.jpg',
    duration: '6:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '5K',
    likes: '58',
    dislikes: '4',
  ),
];

final List<Video> suggestedVideos = [
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '312K',
    likes: '8.9k',
    dislikes: '7',
  ),
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '290K',
    likes: '9.3K',
    dislikes: '45',
  ),
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter Chat UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/h-igXZCCrrc/0.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '1.5M',
    likes: '200k',
    dislikes: '8',
  ),
];

final List<String> ids = [
  'nPt8bK2gbaU',
  'gQDByCdjUXw',
  'iLnmTe5Q2Qw',
  '_WoCV4c6XOE',
  'KmzdUe0RSJo',
  '6jZDSSZZxjQ',
  'p2lYr3vM_1w',
  '7QUtEmBT_-w',
  '34_PXCzGw1M',
];
// 
 

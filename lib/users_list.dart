import 'dart:math';

class User {
  final String name;
  final int age;
  final String videoUrl;
  final String location;
  final String imageUrl;

  User({
    required this.name,
    required this.age,
    required this.videoUrl,
    required this.imageUrl,
    required this.location,
  });
}

final Random random = Random();
final List<User> usersList = [
  User(
    name: "Arthur Smith",
    age: 25,
    videoUrl:
        "https://videos.pexels.com/video-files/2795401/2795401-sd_540_960_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577009/pexels-photo-1577009.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Phoenix, USA",
  ),
  User(
    name: "Courtney Brown",
    age: 30,
    videoUrl:
        "https://videos.pexels.com/video-files/2791669/2791669-sd_540_960_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "New York, USA",
  ),
  User(
    name: "Arthur Jones",
    age: 22,
    videoUrl:
        "https://videos.pexels.com/video-files/4434136/4434136-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Los Angeles, USA",
  ),
  User(
    name: "Arthur Williams",
    age: 28,
    videoUrl:
        "https://videos.pexels.com/video-files/4650486/4650486-hd_720_1366_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577012/pexels-photo-1577012.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Chicago, USA",
  ),
  User(
    name: "Courtney Taylor",
    age: 27,
    videoUrl:
        "https://videos.pexels.com/video-files/5353260/5353260-sd_540_960_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577013/pexels-photo-1577013.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Houston, USA",
  ),
  User(
    name: "Arthur Lee",
    age: 24,
    videoUrl:
        "https://videos.pexels.com/video-files/8044824/8044824-sd_540_960_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577014/pexels-photo-1577014.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "San Diego, USA",
  ),
  User(
    name: "Arthur Clark",
    age: 32,
    videoUrl:
        "https://videos.pexels.com/video-files/8233934/8233934-hd_720_1366_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577015/pexels-photo-1577015.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Austin, USA",
  ),
  User(
    name: "Courtney Walker",
    age: 29,
    videoUrl:
        "https://videos.pexels.com/video-files/7505763/7505763-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577016/pexels-photo-1577016.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Dallas, USA",
  ),
  User(
    name: "Arthur Harris",
    age: 21,
    videoUrl:
        "https://videos.pexels.com/video-files/6586074/6586074-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1362724/pexels-photo-1362724.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "San Francisco, USA",
  ),
  User(
    name: "Arthur Lewis",
    age: 35,
    videoUrl:
        "https://videos.pexels.com/video-files/6799742/6799742-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577018/pexels-photo-1577018.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Seattle, USA",
  ),
  User(
    name: "Courtney Hall",
    age: 23,
    videoUrl:
        "https://videos.pexels.com/video-files/8588877/8588877-hd_720_1366_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/3304341/pexels-photo-3304341.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Boston, USA",
  ),
  User(
    name: "Arthur Queen",
    age: 26,
    videoUrl:
        "https://videos.pexels.com/video-files/4990426/4990426-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1758144/pexels-photo-1758144.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Denver, USA",
  ),
  User(
    name: "Arthur Wright",
    age: 33,
    videoUrl:
        "https://videos.pexels.com/video-files/7550765/7550765-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1755385/pexels-photo-1755385.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Las Vegas, USA",
  ),
  User(
    name: "Courtney Scott",
    age: 20,
    videoUrl:
        "https://videos.pexels.com/video-files/7302975/7302975-sd_540_960_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577022/pexels-photo-1577022.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Miami, USA",
  ),
  User(
    name: "Arthur Adams",
    age: 31,
    videoUrl:
        "https://videos.pexels.com/video-files/4936970/4936970-sd_540_960_24fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577026/pexels-photo-1577026.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Orlando, USA",
  ),
  User(
    name: "Arthur Nelson",
    age: 34,
    videoUrl:
        "https://videos.pexels.com/video-files/4835063/4835063-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/3027243/pexels-photo-3027243.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Atlanta, USA",
  ),
  User(
    name: "Courtney Carter",
    age: 19,
    videoUrl:
        "https://videos.pexels.com/video-files/4759582/4759582-sd_540_960_30fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1577025/pexels-photo-1577025.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Portland, USA",
  ),
  User(
    name: "Arthur Mitchell",
    age: 36,
    videoUrl:
        "https://videos.pexels.com/video-files/2791956/2791956-sd_540_960_25fps.mp4",
    imageUrl:
        'https://images.pexels.com/photos/1183266/pexels-photo-1183266.jpeg?auto=compress&cs=tinysrgb&w=200',
    location: "Philadelphia, USA",
  ),
];

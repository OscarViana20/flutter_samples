class Recommended {
  Recommended({
    required this.id,
    required this.image,
    required this.banner,
    required this.description,
  });
  String id;
  String image;
  String banner;
  String description;
}

class Outstanding {
  late String image;
}

class Game {
  Game({required this.image});
  String image;
}

final recommendList = <Recommended>[
  Recommended(
      id: '1',
      image: 'assets/images/playstation/crash_bandicoot.png',
      banner: 'assets/images/playstation/crash_banner.png',
      description: 'Crash Bandicoot™ 4: It\'s About Time'),
  Recommended(
      id: '2',
      image: 'assets/images/playstation/horizon_forbidden_west.jfif',
      banner: 'assets/images/playstation/horizon-forbidden-west.jpg',
      description: 'Horizon Forbidden West'),
  Recommended(
      id: '3',
      image: 'assets/images/playstation/demons_souls.jpeg',
      banner: 'assets/images/playstation/demons-souls-ps5-2.jpg',
      description: 'Demon\'s souls'),
];

final gameList = <Game>[
  Game(image: 'assets/images/playstation/ratchel_clank.jfif'),
  Game(image: 'assets/images/playstation/gran_turismo.jfif'),
  Game(image: 'assets/images/playstation/sackboy.jfif'),
  Game(image: 'assets/images/playstation/destruction_all_stars.jfif'),
];

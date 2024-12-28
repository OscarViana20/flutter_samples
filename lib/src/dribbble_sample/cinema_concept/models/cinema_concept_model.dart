class Movie {
  Movie({
    this.backgroud,
    required this.id,
    required this.image,
    required this.description,
  });
  String id;
  String image;
  String? backgroud;
  String description;
}

final popularNow = <Movie>[
  Movie(
      id: '1',
      image: 'assets/images/cinema_concept/antman.jfif',
      description: 'Antman and the Wasp'),
  Movie(
      id: '2',
      image: 'assets/images/cinema_concept/skyscraper.jpg',
      description: 'Skyscraper'),
  Movie(
      id: '3',
      image: 'assets/images/cinema_concept/Jurassic.jpg',
      description: 'Jurassic World'),
];

final nowShowing = <Movie>[
  Movie(
      id: '1',
      image: 'assets/images/cinema_concept/antman2.jfif',
      backgroud: 'assets/images/cinema_concept/antman_back.webp',
      description: 'Antman and the Wasp'),
  Movie(
      id: '2',
      image: 'assets/images/cinema_concept/skyscraper2.jpg',
      backgroud: 'assets/images/cinema_concept/skyscraper.jpg',
      description: 'Skyscraper'),
  Movie(
      id: '3',
      image: 'assets/images/cinema_concept/jurassik_world2.jpg',
      backgroud: 'assets/images/cinema_concept/Jurassic.jpg',
      description: 'Jurassic World'),
];

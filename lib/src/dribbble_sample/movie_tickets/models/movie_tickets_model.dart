import 'package:flutter/material.dart';

class TimeDay {
  TimeDay({required this.index, required this.hour, required this.isAll});
  int index;
  String hour;
  bool isAll;
}

class ShowDate {
  ShowDate({
    required this.day,
    required this.date,
  });
  String day;
  String date;
}

class Charater {
  Charater({
    required this.image,
    required this.actorName,
    required this.charaterName,
  });
  String image;
  String actorName;
  String charaterName;
}

class Trailer {
  Trailer({required this.imageTrailer, required this.initialVideoId});
  String imageTrailer;
  String initialVideoId;
}

class Movie {
  Movie({
    required this.id,
    required this.imdb,
    required this.name,
    required this.image,
    required this.story,
    required this.actors,
    required this.times,
    required this.trailers,
    required this.charaters,
    required this.showDates,
  });

  String id;
  String imdb;
  String name;
  String image;
  String story;
  String actors;
  List<TimeDay> times;
  List<Trailer> trailers;
  List<Charater> charaters;
  List<ShowDate> showDates;
}

final colors = <Color>[
  Color(0xff0c4ea6),
  Color(0xfffca1b2),
  Color(0xff381b10),
];

final popularList = <Movie>[
  Movie(
      id: '1',
      imdb: '9.0',
      name: 'Frozen II - Original Motion Picture Soundtrack',
      image: 'assets/images/movie_ticket/Frozen_2.jpg',
      actors: 'Kristen Bell, Josh Gad, Idina Menzel...',
      story:
          'Why was Elsa born with magica powers? The answer is calling her and threatening her kingdom. Together with Anna, Kristoff, Olaf and Sven, she\'ll set out on a dangerous but remarkable journey...',
      charaters: [
        Charater(
            image: "assets/images/movie_ticket/elsa.webp",
            charaterName: 'Elsa',
            actorName: 'Kristen Bell'),
        Charater(
            image: "assets/images/movie_ticket/anna.webp",
            charaterName: 'Anna',
            actorName: 'Idina Menzel'),
        Charater(
            image: "assets/images/movie_ticket/olaf.webp",
            charaterName: 'Olaf',
            actorName: 'Josh Gad'),
        Charater(
            image: "assets/images/movie_ticket/kristoff.webp",
            charaterName: 'Kristoff',
            actorName: 'Jonathan Groff'),
        Charater(
            image: "assets/images/movie_ticket/sven.webp",
            charaterName: 'Sven',
            actorName: 'Jonathan Groff'),
      ],
      trailers: [
        Trailer(
            initialVideoId: 'Zi4LMpSDccc',
            imageTrailer: 'assets/images/movie_ticket/oficialTrailer.jpg'),
        Trailer(
            initialVideoId: 'bwzLiQZDw2I',
            imageTrailer: 'assets/images/movie_ticket/oficialTrailer2.jpg'),
        Trailer(
            initialVideoId: 'eSLe4HuKuK0',
            imageTrailer: 'assets/images/movie_ticket/teaserTrailer.jpg'),
      ],
      showDates: [
        ShowDate(day: "Friday", date: "2 Dec"),
        ShowDate(day: "Saturday", date: "3 Dec"),
        ShowDate(day: "Sunday", date: "4 Dec"),
        ShowDate(day: "Monday", date: "5 Dec"),
        ShowDate(day: "Tueday", date: "6 Dec"),
      ],
      times: [
        TimeDay(index: 0, hour: '09:00 AM', isAll: true),
        TimeDay(index: 1, hour: '11:00 AM', isAll: false),
        TimeDay(index: 2, hour: '01:30 AM', isAll: false),
        TimeDay(index: 3, hour: '04:00 PM', isAll: false),
        TimeDay(index: 4, hour: '07:00 PM', isAll: false),
        TimeDay(index: 5, hour: '09:00 PM', isAll: true)
      ]),
  Movie(
      id: '2',
      imdb: '9.5',
      name: 'Joker 2019',
      image: 'assets/images/movie_ticket/joker.jfif',
      actors: 'Joaquin Phoenix, Robert De Niro, Zazie Bets...',
      story:
          'Why was Elsa born with magica powers? The answer is calling her and threatening her kingdom. Together with Anna, Kristoff, Olaf and Sven, she\'ll set out on a dangerous but remarkable journey...',
      charaters: [
        Charater(
            image: "assets/images/movie_ticket/elsa.webp",
            charaterName: 'Elsa',
            actorName: 'Kristen Bell'),
        Charater(
            image: "assets/images/movie_ticket/anna.webp",
            charaterName: 'Anna',
            actorName: 'Idina Menzel'),
        Charater(
            image: "assets/images/movie_ticket/olaf.webp",
            charaterName: 'Olaf',
            actorName: 'Josh Gad'),
        Charater(
            image: "assets/images/movie_ticket/kristoff.webp",
            charaterName: 'Kristoff',
            actorName: 'Jonathan Groff'),
        Charater(
            image: "assets/images/movie_ticket/sven.webp",
            charaterName: 'Sven',
            actorName: 'Jonathan Groff'),
      ],
      trailers: [
        Trailer(
            initialVideoId: 'Zi4LMpSDccc',
            imageTrailer: 'assets/images/movie_ticket/oficialTrailer.jpg'),
        Trailer(
            initialVideoId: 'bwzLiQZDw2I',
            imageTrailer: 'assets/images/movie_ticket/oficialTrailer2.jpg'),
        Trailer(
            initialVideoId: 'eSLe4HuKuK0',
            imageTrailer: 'assets/images/movie_ticket/teaserTrailer.jpg'),
      ],
      showDates: [
        ShowDate(day: "Friday", date: "2 DEC"),
        ShowDate(day: "Saturday", date: "3 DEC"),
        ShowDate(day: "Sunday", date: "4 DEC"),
        ShowDate(day: "Monday", date: "5 DEC"),
        ShowDate(day: "Tueday", date: "6 DEC"),
      ],
      times: [
        TimeDay(index: 0, hour: '09:00 AM', isAll: true),
        TimeDay(index: 1, hour: '11:00 AM', isAll: false),
        TimeDay(index: 2, hour: '01:30 AM', isAll: false),
        TimeDay(index: 3, hour: '04:00 PM', isAll: false),
        TimeDay(index: 4, hour: '07:00 PM', isAll: false),
        TimeDay(index: 5, hour: '09:00 PM', isAll: true)
      ]),
  Movie(
      id: '3',
      imdb: '9.0',
      name: 'Venom: Let There Be Carnage',
      image: 'assets/images/movie_ticket/venom.jpg',
      actors: 'Tom Hardy, Woody Harrelson, Michielle Williams...',
      story:
          'Why was Anna born with magica powers? The answer is calling her and threatening her kingdom. Together with Anna, Kristoff, Olaf and Sven, she\'ll set out on a dangerous but remarkable journey...',
      charaters: [
        Charater(
            image: "assets/images/movie_ticket/elsa.webp",
            charaterName: 'Elsa',
            actorName: 'Kristen Bell'),
        Charater(
            image: "assets/images/movie_ticket/anna.webp",
            charaterName: 'Anna',
            actorName: 'Idina Menzel'),
        Charater(
            image: "assets/images/movie_ticket/olaf.webp",
            charaterName: 'Olaf',
            actorName: 'Josh Gad'),
        Charater(
            image: "assets/images/movie_ticket/kristoff.webp",
            charaterName: 'Kristoff',
            actorName: 'Jonathan Groff'),
        Charater(
            image: "assets/images/movie_ticket/sven.webp",
            charaterName: 'Sven',
            actorName: 'Jonathan Groff'),
      ],
      trailers: [
        Trailer(
            initialVideoId: 'Zi4LMpSDccc',
            imageTrailer: 'assets/images/movie_ticket/oficialTrailer.jpg'),
        Trailer(
            initialVideoId: 'bwzLiQZDw2I',
            imageTrailer: 'assets/images/movie_ticket/oficialTrailer2.jpg'),
        Trailer(
            initialVideoId: 'eSLe4HuKuK0',
            imageTrailer: 'assets/images/movie_ticket/teaserTrailer.jpg'),
      ],
      showDates: [
        ShowDate(day: "Friday", date: "2 Dec"),
        ShowDate(day: "Saturday", date: "3 Dec"),
        ShowDate(day: "Sunday", date: "4 Dec"),
        ShowDate(day: "Monday", date: "5 Dec"),
        ShowDate(day: "Tueday", date: "6 Dec"),
      ],
      times: [
        TimeDay(index: 0, hour: '09:00 AM', isAll: true),
        TimeDay(index: 1, hour: '11:00 AM', isAll: false),
        TimeDay(index: 2, hour: '01:30 AM', isAll: false),
        TimeDay(index: 3, hour: '04:00 PM', isAll: false),
        TimeDay(index: 4, hour: '07:00 PM', isAll: false),
        TimeDay(index: 5, hour: '09:00 PM', isAll: true)
      ]),
];

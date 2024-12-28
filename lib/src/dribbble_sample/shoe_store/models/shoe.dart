class Shoe {
  Shoe({
    required this.name,
    required this.image,
    required this.detail,
    required this.ranking,
    required this.currentPrice,
    required this.beforePrice,
    required this.description,
  });

  final String name;
  final String image;
  final String detail;
  final double ranking;
  final double currentPrice;
  final double beforePrice;
  final String description;
}

List<Shoe> get shoes {
  return [
    Shoe(
      name: "Air Jordan 1 Mid",
      image: "assets/images/shoe_store/shoe1.png",
      detail: "Man's Shoes",
      ranking: 4.5,
      currentPrice: 149,
      beforePrice: 179,
      description:
          "Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind. Designed to carry you from the first through the fourth.",
    ),
    Shoe(
      name: "Tatum 1 Home Team PF",
      image: "assets/images/shoe_store/shoe2.png",
      detail: "Basketball Shoes",
      ranking: 4.5,
      currentPrice: 127,
      beforePrice: 159,
      description:
          "Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind. Designed to carry you from the first through the fourth.",
    ),
    Shoe(
      name: "Sabrina 1 By You",
      image: "assets/images/shoe_store/shoe3.png",
      detail: "Custom Basketball Shoes",
      ranking: 4.5,
      currentPrice: 170,
      beforePrice: 190,
      description:
          "Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind. Designed to carry you from the first through the fourth.",
    ),
    Shoe(
      name: "KD16 EP",
      image: "assets/images/shoe_store/shoe5.png",
      detail: "Basketball shoes",
      ranking: 4.5,
      currentPrice: 179,
      beforePrice: 210,
      description:
          "Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind. Designed to carry you from the first through the fourth.",
    ),
    Shoe(
      name: "Basketball shoes",
      image: "assets/images/shoe_store/shoe4.png",
      detail: "Women's Shoes",
      ranking: 4.5,
      currentPrice: 149,
      beforePrice: 179,
      description:
          "Your love for the game never fades. That's why the Tatum 1 was created with longevity in mind. Designed to carry you from the first through the fourth.",
    ),
  ];
}

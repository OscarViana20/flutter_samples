class Offer {
  Offer({
    required this.index,
    required this.image,
  });

  final int index;
  final String image;
}

List<Offer> get offers {
  return [
    Offer(index: 0, image: 'assets/images/shoe_store/offer1.jpg'),
    Offer(index: 1, image: 'assets/images/shoe_store/offer2.jpg'),
    Offer(index: 2, image: 'assets/images/shoe_store/offer3.jpg'),
    Offer(index: 3, image: 'assets/images/shoe_store/offer4.jpeg'),
    Offer(index: 4, image: 'assets/images/shoe_store/offer5.webp'),
  ];
}

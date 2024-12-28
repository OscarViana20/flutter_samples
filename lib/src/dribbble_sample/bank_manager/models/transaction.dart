class Transaction {
  Transaction({
    required this.id,
    required this.concept,
    required this.image,
    required this.nextDate,
    required this.amount,
  });

  final int id;
  final String concept;
  final String image;
  final String nextDate;
  final double amount;
}
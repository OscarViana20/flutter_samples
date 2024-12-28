import 'transaction.dart';

class BankCard {
  BankCard({
    required this.image,
    required this.amount,
    required this.transaction,
  });

  final String image;
  final double amount;
  final Transaction transaction;
}

List<BankCard> get bankCards {
  return [
    BankCard(
      image: 'assets/images/bank_manager/bbva.webp',
      amount: 1036,
      transaction: Transaction(
        id: 0,
        concept: 'Netflix',
        image: 'assets/images/bank_manager/netflix-icon.png',
        nextDate: 'Next 30 Jan',
        amount: -10.0,
      ),
    ),
    BankCard(
      image: 'assets/images/bank_manager/us.png',
      amount: 1036,
      transaction: Transaction(
        id: 1,
        concept: 'Disney plus',
        image: 'assets/images/bank_manager/disney-plus.png',
        nextDate: 'Next 30 Jul',
        amount: -36.0,
      ),
    ),
    BankCard(
      image: 'assets/images/bank_manager/us_blue.png',
      amount: 1036,
      transaction: Transaction(
        id: 2,
        concept: 'HBO MAX',
        image: 'assets/images/bank_manager/hbo-max-logo.webp',
        nextDate: 'Next 29 Aug',
        amount: 42.0,
      ),
    ),
  ];
}

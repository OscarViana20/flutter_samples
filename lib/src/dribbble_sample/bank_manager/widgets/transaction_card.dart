import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransacctionCard extends StatelessWidget {
  const TransacctionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE3E3FE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.asset(fit: BoxFit.cover, transaction.image),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.nextDate,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.purple.shade900.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  transaction.concept,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              '${transaction.amount}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

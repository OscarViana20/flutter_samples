import 'package:flutter/material.dart';

import '../models/bank_card.dart';
import 'transaction_card.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
    required this.pageOffset,
    required this.currentPage,
    required this.verticalPos,
  });

  final int currentPage;
  final double pageOffset;
  final double verticalPos;

  @override
  Widget build(BuildContext context) {
    final bankCard = bankCards[currentPage < 1 ? 0 : currentPage - 1];
    return Positioned(
      left: 30.0,
      right: 30.0,
      bottom: -verticalPos,
      child: Opacity(
        opacity: pageOffset.clamp(0, 1),
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          transitionBuilder: _transitionBuilder,
          child: TransacctionCard(
            key: ValueKey(bankCard.transaction.id),
            transaction: bankCard.transaction,
          ),
        ),
      ),
    );
  }

  Widget _transitionBuilder(child, animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset.zero).animate(
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        ),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ShoeAppBar extends StatelessWidget {
  const ShoeAppBar({
    super.key,
    this.showBack = false,
  });

  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (showBack) ...[
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        size: 12,
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
            Image.asset(
              fit: BoxFit.fill,
              'assets/images/shoe_store/icon_mark.png',
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.favorite_border_outlined, color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
            ),
            Icon(Icons.grid_view_rounded, color: Colors.white),
          ],
        )
      ],
    );
  }
}

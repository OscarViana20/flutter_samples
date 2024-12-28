import 'package:flutter/material.dart';

import '../models/offer.dart';

class GalleryOffers extends StatefulWidget {
  const GalleryOffers({super.key});

  @override
  State<GalleryOffers> createState() => _GalleryOffersState();
}

class _GalleryOffersState extends State<GalleryOffers> {
  late final PageController pageController;

  double currentPage = 0.0;

  void _offerScrollListener() {
    setState(() => currentPage = pageController.page ?? 0.0);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(_offerScrollListener);
  }

  @override
  void dispose() {
    pageController.removeListener(_offerScrollListener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 120,
          child: PageView.builder(
            controller: pageController,
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers.elementAt(index);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(fit: BoxFit.fill, offer.image),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (final offer in offers) _pageIndicator(offer)],
        )
      ],
    );
  }

  Widget _pageIndicator(Offer offer) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(
          offer.index,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
        );
      },
      child: Container(
        width: 9.0,
        height: 9.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
          color: offer.index == currentPage.toInt() ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}

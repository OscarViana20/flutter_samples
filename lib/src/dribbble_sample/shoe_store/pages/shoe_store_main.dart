import 'package:flutter/material.dart';

import '../widgets/gallery_offers.dart';
import '../widgets/gallery_shoes.dart';
import '../widgets/layout_page.dart';
import '../widgets/shoe_app_bar.dart';
import '../widgets/input_search.dart';
import '../widgets/type_filters.dart';

class ShoeStoreMain extends StatelessWidget {
  const ShoeStoreMain({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      child: Column(
        children: [
          ShoeAppBar(),
          InputSearch(),
          GalleryOffers(),
          TypeFilters(),
          GalleryShoes(),
        ],
      ),
    );
  }
}

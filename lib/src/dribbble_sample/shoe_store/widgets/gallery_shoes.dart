import 'package:flutter/material.dart';

import '../models/shoe.dart';
import '../pages/shoe_detail.dart';

class GalleryShoes extends StatefulWidget {
  const GalleryShoes({super.key});

  @override
  State<GalleryShoes> createState() => _GalleryShoesState();
}

class _GalleryShoesState extends State<GalleryShoes> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final aspectRatio = screenWidth / (screenWidth * 4.2 / 3);
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(0.0),
        itemCount: shoes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de columnas
          mainAxisSpacing: 10.0, // Espacio entre filas
          crossAxisSpacing: 10.0, // Espacio entre columnas
          childAspectRatio: aspectRatio, // Relación de aspecto de cada celda
        ),
        itemBuilder: (context, index) => _shoeCard(shoes[index], index),
      ),
    );
  }

  Widget _shoeCard(Shoe shoe, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 12.0),
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      SlowMaterialPageRoute(
                        builder: (context) => ShoeDetail(
                          index: index,
                          size: MediaQuery.of(context).size,
                        ),
                      ),
                    ),
                    child: Hero(
                      tag: 'shoe-${index}',
                      child: Transform.rotate(
                        angle: 0.25,
                        child: Image.asset(fit: BoxFit.fill, shoe.image),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 15),
                          Text(
                            '${shoe.ranking}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            shoe.name,
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.0),
          Text(
            shoe.detail,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '\$${shoe.currentPrice.toInt()}',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '\$${shoe.beforePrice.toInt()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(size: 16, Icons.favorite, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}

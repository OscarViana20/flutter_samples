import 'package:flutter/material.dart';

import '../models/filters.dart';

class TypeFilters extends StatelessWidget {
  const TypeFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: SizedBox(
        height: 45.0,
        child: ListView.builder(
          itemCount: filters.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _filter(filters[index].text, index);
          },
        ),
      ),
    );
  }

  Widget _filter(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: index == 0 ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 2.0,
            color: index == 0 ? Colors.white : Colors.grey,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: index == 0 ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}

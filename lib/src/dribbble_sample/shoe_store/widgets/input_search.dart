import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white12,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
          labelText: 'Search product',
          labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          floatingLabelStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: _border(),
          enabledBorder: _border(),
        ),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    );
  }
}

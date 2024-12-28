import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.pageOffset,
    required this.verticalPos,
    required this.onVerticalDragEnd,
    required this.onVerticalDragUpdate,
  });

  final double pageOffset;
  final double verticalPos;
  final Function(DragEndDetails) onVerticalDragEnd;
  final Function(DragUpdateDetails) onVerticalDragUpdate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomPosition = size.height * 0.77 - verticalPos;
    final clampedPosition =
        verticalPos > size.height / 2 ? verticalPos.clamp(0.0, 30.0) : 0.0;
    return Positioned(
      top: 30.0 - clampedPosition,
      left: 30.0 - clampedPosition,
      right: 30.0 - clampedPosition,
      bottom: bottomPosition,
      child: Opacity(
        opacity: pageOffset.clamp(0, 1),
        child: GestureDetector(
          onVerticalDragEnd: onVerticalDragEnd,
          onVerticalDragUpdate: onVerticalDragUpdate,
          child: Column(
            children: [
              _buildContent(size, clampedPosition),
              if (bottomPosition > 0) _buildDivider()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Size size, double clampedPosition) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(228, 227, 255, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0 - clampedPosition),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30.0 + clampedPosition),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildName(),
                _buildAvatar(),
              ],
            ),
            if (verticalPos > size.height / 3) _buildBody(size),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return RichText(
      text: TextSpan(
        text: 'Hello',
        style: TextStyle(fontSize: 30.0, color: Colors.purple.shade900),
        children: [
          TextSpan(
            text: ' Iván',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 75,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            foregroundImage: AssetImage('assets/images/bank_manager/user.jpeg'),
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              ),
              child: const Icon(size: 30.0, Icons.credit_card_rounded),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(Size size) {
    return Opacity(
      opacity: lerpDouble(0.0, 1.0, verticalPos / size.height)!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOption(text: 'Search', iconData: Icons.search),
                _buildOptionAvatar(text: 'Oscar', namePath: 'user.jpeg'),
                _buildOptionAvatar(text: 'Joseph', namePath: 'user.jpeg'),
                _buildOptionAvatar(text: 'Alex', namePath: 'user.jpeg'),
              ],
            ),
            SizedBox(height: 30.0),
            _buildConcept(),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({required String text, required IconData iconData}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Icon(size: 30.0, iconData, color: Colors.black),
        ),
        const SizedBox(height: 10.0),
        Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildOptionAvatar({required String text, required String namePath}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28.0,
          foregroundImage: AssetImage('assets/images/bank_manager/$namePath'),
        ),
        const SizedBox(height: 10.0),
        Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildConcept() {
    return Container(
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Color(0xFFACCFFF),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
                colors: [Color(0xFFFFFFFF), Color(0xFFB3B2B1)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(203, 226, 255, 1),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    "Holiday goal",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(134, 130, 194, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$ 100',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '   \$ 5000',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        width: 50.0,
        height: 5.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}

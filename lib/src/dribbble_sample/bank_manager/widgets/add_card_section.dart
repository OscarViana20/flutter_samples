import 'package:flutter/material.dart';

class AddCardSection extends StatelessWidget {
  const AddCardSection({
    super.key,
    required this.xOffset,
    required this.pageOffset,
    required this.verticalPos,
  });

  final double xOffset;
  final double pageOffset;
  final double verticalPos;

  final style = const TextStyle(
    fontSize: 22.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final pageClamp = pageOffset.clamp(0.0, 1.0);
    final opacity = pageOffset < 0.2 ? 1.0 : 0.0;

    return Positioned(
      left: pageClamp * 20,
      top: pageClamp * 205 + verticalPos,
      right: pageClamp * 80,
      bottom: pageClamp * 130 - verticalPos,
      child: Transform.translate(
        offset: Offset(xOffset, 0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF070945),
            borderRadius: BorderRadius.circular(pageClamp * 30.0),
          ),
          child: AnimatedOpacity(
            opacity: opacity,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: [
                _buildHeader(),
                _buildBody(),
                _buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: const Color(0x4B10006A),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(size: 25, Icons.rectangle, color: Colors.white),
              const SizedBox(width: 10.0),
              Text(
                'Credit Card',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Icon(size: 25, Icons.credit_card, color: Colors.white),
              const SizedBox(width: 10.0),
              Text(
                'Open an account',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Align(
                widthFactor: 0.5,
                child: _buildCircleAvatar(
                  const Color(0xFF2C18E0),
                  Colors.black,
                ),
              ),
              _buildCircleAvatar(Colors.white, const Color(0xFF2C18E0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Column(
        children: [
          const Text(
            'Your card number',
            style: const TextStyle(fontSize: 16, color: Color(0xFF5B4AFB)),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 12,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 100,
              ),
              itemBuilder: (context, index) {
                if (index == 9 || index == 11) {
                  return Icon(
                    size: 28,
                    color: Colors.white,
                    index == 9
                        ? Icons.qr_code_scanner
                        : Icons.backspace_outlined,
                  );
                }
                return Center(
                  child: Text('${index == 10 ? 0 : index + 1}', style: style),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20.0),
          minimumSize: const Size(double.infinity, 50.0),
          backgroundColor: const Color(0xFF10006A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Add card',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(Color backgroundColor, Color iconColor) {
    return CircleAvatar(
      radius: 14.0,
      backgroundColor: backgroundColor,
      child: Icon(Icons.euro, size: 14, color: iconColor),
    );
  }
}

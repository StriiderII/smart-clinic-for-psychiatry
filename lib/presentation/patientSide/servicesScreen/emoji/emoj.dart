import 'package:flutter/material.dart';

class Emoj extends StatelessWidget {
  const Emoj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          Image.asset(
            'assets/images/happy.png',
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Image.asset(
            'assets/images/calm.png',
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Image.asset(
            'assets/images/relax.png',
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Image.asset(
            'assets/images/focus.png',
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

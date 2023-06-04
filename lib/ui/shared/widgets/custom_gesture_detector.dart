import 'package:app/ui/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomGestureDetector extends StatelessWidget {
  final String text;
  final Widget page;

  const CustomGestureDetector(this.text, this.page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            child: Text(
              text,
              style: kGestureTextStyle,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
          ),
        ],
      ),
    );
  }
}

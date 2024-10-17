import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xff949D9E),
            thickness: 1,
          ),
        ),
        Text(
          ' or ',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xff000000).withOpacity(.4)),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xff949D9E),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

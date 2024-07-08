import 'package:flutter/material.dart';

import '../../../Core/constants/responsive.dart';
import '../../../Core/constants/text.dart';

class RegisterComponentsWidget extends StatelessWidget {
  const RegisterComponentsWidget({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextBody16(
              title,
              color: Colors.grey.shade500,
            ),
          ],
        ),
        SizedBox(
          height: heightRation(context, 8),
        ),
        child,
      ],
    );
  }
}

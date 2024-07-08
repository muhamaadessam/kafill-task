import 'package:flutter/material.dart';

import '../../../Core/constants/colors.dart';
import '../../../Core/constants/responsive.dart';
import '../../../Core/constants/text.dart';

class WhoAmIComponentsWidget extends StatelessWidget {
  const WhoAmIComponentsWidget({
    super.key,
    required this.title,
    this.data,
    this.child,
  });

  final String title;
  final String? data;
  final Widget? child;

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
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: child ??
                TextBody16(
                  data!,
                  color: Colors.grey.shade800,
                ),
          ),
        ),
      ],
    );
  }
}

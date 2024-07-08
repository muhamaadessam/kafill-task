import 'package:flutter/material.dart';

import '../../../Core/constants/colors.dart';
import '../../../Core/constants/responsive.dart';
import '../../../Core/constants/text.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            color: Color(0xff202020).withOpacity(.1),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      width: widthRation(context, 160),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/png/Product pic.png',
                    width: widthRation(context, 160),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(27)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16),
                      child: TextBody16(
                        '\$100',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightRation(context, 8),
            ),
            const TextBody16('Logo Design -Graphic Design Graphic Design'),
            SizedBox(
              height: heightRation(context, 8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/png/star.png',
                  width: widthRation(context, 20),
                ),
                SizedBox(
                  width: widthRation(context, 8),
                ),
                const TextBody16(
                  '(4.5)',
                  color: Color(0xffFFCB31),
                ),
                SizedBox(
                  width: widthRation(context, 8),
                ),
                Image.asset(
                  'assets/png/line.png',
                  width: widthRation(context, 1),
                ),
                SizedBox(
                  width: widthRation(context, 8),
                ),
                Image.asset(
                  'assets/png/cart.png',
                  width: widthRation(context, 20),
                ),
                SizedBox(
                  width: widthRation(context, 8),
                ),
                TextBody16(
                  '22',
                  color: Color(0xff828282),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hiring_task/Core/components/CustomWidgets/custom_scaffold.dart';
import 'package:hiring_task/Core/constants/responsive.dart';
import 'package:hiring_task/Core/constants/text.dart';
import 'package:hiring_task/Services/Presentation/Components/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.paddingOf(context).top,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0,top: 24),
              child: Row(
                children: [
                  TextTitle('Services'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0,horizontal: 8),
                    child: ServiceCard(),
                  ),
                ),
              ),
            ),
            SizedBox(height: heightRation(context, 16),),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  TextTitle('Popular Services'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                      (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0,horizontal: 8),
                    child: ServiceCard(),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

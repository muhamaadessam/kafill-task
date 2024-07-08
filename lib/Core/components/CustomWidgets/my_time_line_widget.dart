import 'package:flutter/material.dart';
import 'package:hiring_task/Core/constants/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants/responsive.dart';
import '../../constants/text.dart';

class MyTimeLineOrder extends StatelessWidget {
  const MyTimeLineOrder({
    super.key,
    this.isCurrent = false,
    this.isCompleted = false,
    this.isNotCompleted = false,
    required this.title,
    required this.index,
    this.axis = TimelineAxis.horizontal,
  });

  final bool isCompleted;
  final bool isCurrent;
  final bool isNotCompleted;
  final String title;
  final String index;
  final TimelineAxis axis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightRation(context, 60),
      // width: widthRation(context, width),
      child: TimelineTile(
        alignment: TimelineAlign.end,
        axis: axis,
        beforeLineStyle: LineStyle(
          color:  isNotCompleted
                  ? const Color(0xffE6EAEF)
                  : isCompleted
                      ? mainColor
                      : isCurrent
                          ? mainColor
                          : Colors.red,
        ),
        afterLineStyle: LineStyle(
          color: isNotCompleted
              ? const Color(0xffE6EAEF)
              : isCompleted
                  ? mainColor
                  : isCurrent
                      ?  const Color(0xffE6EAEF)
                      : Colors.red,
        ),
        indicatorStyle: IndicatorStyle(
            color: mainColor,
            width: 30,
            height: 30,
            indicator: isNotCompleted
                ? const CircleAvatar(
                    backgroundColor: Color(0xffE6EAEF),
                    radius: 25,
                  )
                : isCompleted || isCurrent
                    ? CircleAvatar(
                        backgroundColor: mainColor,
                        radius: 25,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: TextBody16(
                            index,
                            color: mainColor,
                          ),
                        ),
                      )
                    : const CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 25,
                      )),
        startChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: TextBody16(
            title,
            color: isNotCompleted
                ? const Color(0xffE6EAEF)
                : isCompleted || isCurrent
                    ? mainColor
                    : Colors.red,
          ),
        ),
      ),
    );
  }
}

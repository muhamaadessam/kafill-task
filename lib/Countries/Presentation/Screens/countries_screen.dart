import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/Core/constants/colors.dart';
import 'package:hiring_task/Countries/Presentation/Controllers/countries_cubit.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../Core/components/CustomWidgets/custom_scaffold.dart';
import '../../../Core/constants/responsive.dart';
import '../../../Core/constants/text.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NumberPaginatorController numberPaginatorController =
        NumberPaginatorController();

    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<CountriesCubit, CountriesState>(
          builder: (context, state) {
            CountriesCubit countriesCubit = CountriesCubit.get(context);
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.paddingOf(context).top,
                ),
                const Row(
                  children: [
                    TextTitle('Countries'),
                  ],
                ),
                SizedBox(
                  height: heightRation(context, 32),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        color: const Color(0xff202020).withOpacity(.1),
                        blurRadius: 40,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: textInputColor,
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10),
                                    ),
                                  ),
                                  height: heightRation(context, 40),
                                  child: const Center(
                                    child: TextBody16(
                                      'Country',
                                      color: Color(0xff696F79),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: heightRation(context, 40),
                                  decoration: const BoxDecoration(
                                    color: textInputColor,
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10),
                                    ),
                                  ),
                                  child: const Center(
                                    child: TextBody16(
                                      'Capital',
                                      color: Color(0xff696F79),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const TableRow(children: [
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ]),
                            ...List.generate(
                              8,
                              (index) => TableRow(
                                children: [
                                  Column(
                                    children: [
                                      const Center(
                                        child: TextBody16(
                                          'Egypt',
                                        ),
                                      ),
                                      index != 7
                                          ? const Divider(
                                              color: Color(0xffF2F2F2),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Center(
                                        child: TextBody16(
                                          'Cairo',
                                        ),
                                      ),
                                      index != 7
                                          ? const Divider(
                                              color: Color(0xffF2F2F2),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightRation(context, 24),
                ),
                NumberPaginator(
                  controller: numberPaginatorController,
                  numberPages: 10,
                  onPageChange: (int index) {
                    countriesCubit.changeCurrentPage(index);
                  },
                  initialPage: 5,
                  config: NumberPaginatorUIConfig(
                    // default height is 48
                    height: 48,
                    buttonShape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xffE6EAEF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    buttonSelectedForegroundColor: Colors.white,
                    buttonUnselectedForegroundColor: Colors.black,
                    buttonUnselectedBackgroundColor: Colors.white,
                    buttonSelectedBackgroundColor: mainColor,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/Core/components/CustomWidgets/custom_scaffold.dart';
import 'package:hiring_task/WhoAmI/Presentation/Controllers/who_am_i_cubit.dart';

import '../../../Core/constants/colors.dart';
import '../../../Core/constants/responsive.dart';
import '../../../Core/constants/text.dart';
import '../../../Registration/Presentation/Components/register_components_widget.dart';
import '../Components/who_am_i_components_widget.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<WhoAmICubit, WhoAmIState>(
            builder: (context, state) {
              WhoAmICubit whoAmICubit = WhoAmICubit.get(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.paddingOf(context).top,
                  ),
                  const Row(
                    children: [
                      TextTitle('Who Am I'),
                    ],
                  ),
                  SizedBox(
                    height: heightRation(context, 32),
                  ),
                  Builder(builder: (context) {
                    if (whoAmICubit.fileToDisplay != null) {
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: widthRation(context, 100),
                            height: heightRation(context, 100),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Image.file(
                              whoAmICubit.fileToDisplay!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              debugPrint('clicked');
                              whoAmICubit.pickFile();
                            },
                            child: const CircleAvatar(
                              backgroundColor: mainColor,
                              radius: 15,
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                              width: widthRation(context, 100),
                              height: heightRation(context, 100),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(700),
                                color: mainColor,
                              ),
                              child: Image.asset(
                                'assets/png/profile.png',
                                fit: BoxFit.cover,
                              )),
                          GestureDetector(
                            onTap: () {
                              debugPrint('clicked');
                              whoAmICubit.pickFile();
                            },
                            child: const CircleAvatar(
                              backgroundColor: mainColor,
                              radius: 15,
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: WhoAmIComponentsWidget(
                          title: 'First Name',
                          data: 'Mahmoud',
                        ),
                      ),
                      SizedBox(
                        width: widthRation(context, 12),
                      ),
                      const Expanded(
                        child: WhoAmIComponentsWidget(
                          title: 'Last Name',
                          data: 'Mohamed',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  const WhoAmIComponentsWidget(
                    title: 'Email Address',
                    data: 'mahmoud47@gmail.com',
                  ),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  WhoAmIComponentsWidget(
                    title: 'Password',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBody16(
                          whoAmICubit.hiddenPassword ? '******' : 'Mahmoud',
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                        GestureDetector(
                          child: whoAmICubit.hiddenPassword
                              ? Image.asset(
                                  'assets/png/eye-slash.png',
                                  width: 24,
                                  height: 24,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Color(0xff8692A6),
                                  size: 24,
                                ),
                          onTap: () {
                            whoAmICubit.changeShowPassword();
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 8),
                  ),
                  RegisterComponentsWidget(
                    title: 'User Type',
                    child: Row(
                      children: List.generate(
                        whoAmICubit.userTypes.length,
                        (index) => Row(
                          children: [
                            Radio(
                              value: whoAmICubit.userTypes[index],
                              groupValue: whoAmICubit.userType,
                              onChanged: (value) {},
                            ),
                            TextBody16(
                              whoAmICubit.userTypes[index],
                            ),
                            SizedBox(
                              width: widthRation(context, 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  const WhoAmIComponentsWidget(
                    title: 'About',
                    data:
                        'Lorem ipsum dolor sit amet consectetur. Odio urna sed velit et sed quis. Enim ut sed. sed quis. Enim ut sed.',
                  ),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  WhoAmIComponentsWidget(
                    title: 'Salary',
                    child: Row(
                      children: [
                        TextBody16(
                          'SAR ',
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                        TextBody16(
                          whoAmICubit.salary.toString(),
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 8),
                  ),
                  WhoAmIComponentsWidget(
                    title: 'Birth Date',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBody16(
                          '2000-12-07',
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                        Image.asset(
                          'assets/png/calendar.png',
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  RegisterComponentsWidget(
                    title: 'Gender',
                    child: Row(
                      children: List.generate(
                        whoAmICubit.genderList.length,
                        (index) => Row(
                          children: [
                            Radio(
                              value: whoAmICubit.genderList[index],
                              groupValue: whoAmICubit.gender,
                              onChanged: (value) {},
                            ),
                            TextBody16(
                              whoAmICubit.genderList[index],
                            ),
                            SizedBox(
                              width: widthRation(context, 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  WhoAmIComponentsWidget(
                    title: 'Skills',
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        2,
                        (index) => Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffE9F9F1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const TextBody12(
                                  'Video Production',
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: widthRation(context, 8),
                                ),
                                const Icon(
                                  Icons.close_rounded,
                                  size: 12,
                                  color: mainColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 16),
                  ),
                  RegisterComponentsWidget(
                    title: 'Favourite Social Media',
                    child: Column(
                      children: List.generate(
                          whoAmICubit.socialMediaCheck.length,
                          (index) => Row(
                                children: [
                                  Checkbox(
                                    value: whoAmICubit.socialMediaCheck[index],
                                    onChanged: (value) {},
                                  ),
                                  Image.asset(
                                    whoAmICubit.socialMediaLogo[index],
                                    width: widthRation(context, 20),
                                  ),
                                  SizedBox(
                                    width: widthRation(context, 8),
                                  ),
                                  TextBody16(
                                    whoAmICubit.socialMediaTitle[index],
                                  ),
                                ],
                              )),
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 32),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

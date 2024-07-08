import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/components/CustomWidgets/customTextFormField.dart';
import '../../../Core/components/CustomWidgets/custom_Button.dart';
import '../../../Core/components/CustomWidgets/custom_scaffold.dart';
import '../../../Core/components/CustomWidgets/my_time_line_widget.dart';
import '../Components/register_components_widget.dart';
import '../../../Core/constants/colors.dart';
import '../../../Core/constants/responsive.dart';
import '../../../Core/constants/text.dart';
import '../Controllers/registration_cubit.dart';

class SecondRegisterScreen extends StatelessWidget {
  const SecondRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController aboutController = TextEditingController();
    TextEditingController birthDateController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return CustomScaffold(
      appBar: AppBar(
        title: const TextTitle(
          'Register',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
              RegistrationCubit registrationCubit =
                  RegistrationCubit.get(context);
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    registrationCubit.errorMessage
                        ? Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xffFFF0ED),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/png/Info.png',
                                  width: widthRation(context, 20),
                                ),
                                SizedBox(
                                  width: widthRation(context, 8),
                                ),
                                const TextBody12(
                                  'Fill the required fields',
                                  color: Color(0xffF56342),
                                  fontSize: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heightRation(context, 32),
                        ),
                      ],
                    )
                        : Container(),
                    const Row(
                      children: [
                        Expanded(
                          child: MyTimeLineOrder(
                            title: 'Register',
                            index: '1',
                            isCompleted: true,
                          ),
                        ),
                        Expanded(
                          child: MyTimeLineOrder(
                            title: 'Complete Data',
                            index: '2',
                            isCurrent: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightRation(context, 32),
                    ),
                    Builder(builder: (context) {
                      if (registrationCubit.fileToDisplay != null) {
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
                                registrationCubit.fileToDisplay!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                debugPrint('clicked');
                                registrationCubit.pickFile();
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
                                registrationCubit.pickFile();
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
                    RegisterComponentsWidget(
                      title: 'About',
                      child: CustomTextFormField(
                        controller: aboutController,
                        fillColor: textInputColor,
                        color: Colors.transparent,
                        maxLines: 4,
                      ),
                    ),
                    SizedBox(
                      height: heightRation(context, 16),
                    ),
                    RegisterComponentsWidget(
                      title: 'Salary',
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: heightRation(context, 56),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                registrationCubit.decreaseSalary();
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Icon(
                                  Icons.remove_rounded,
                                  color: mainColor,
                                ),
                              ),
                            ),
                            // SAR 1000
                            Row(
                              children: [
                                TextBody16(
                                  'SAR ',
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                ),
                                TextBody16(
                                  registrationCubit.salary.toString(),
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                registrationCubit.increaseSalary();
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Icon(
                                  Icons.add_rounded,
                                  color: mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightRation(context, 8),
                    ),
                    RegisterComponentsWidget(
                      title: 'Birth Date',
                      child: CustomTextFormField(
                        controller: birthDateController,
                        fillColor: textInputColor,
                        color: Colors.transparent,
                        showErrorMessage: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            registrationCubit.showErrorMessage(true);
                            return '';
                          }
                          return null;
                        },
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/png/calendar.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        readOnly: true,
                        keyboardType: TextInputType.none,
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          ).then((value) {
                            if (value != null) {
                              birthDateController.text =
                                  '${value.year}-${value.month}-${value.day}';
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: heightRation(context, 16),
                    ),
                    RegisterComponentsWidget(
                      title: 'Gender',
                      child: Row(
                        children: List.generate(
                          registrationCubit.genderList.length,
                          (index) => Row(
                            children: [
                              Radio(
                                value: registrationCubit.genderList[index],
                                groupValue: registrationCubit.gender,
                                onChanged: (value) {
                                  registrationCubit.changeGender(value!);
                                },
                              ),
                              TextBody16(
                                registrationCubit.genderList[index],
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
                    RegisterComponentsWidget(
                      title: 'Skills',
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(
                              registrationCubit.mySkills.length,
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
                                      TextBody12(
                                        registrationCubit.mySkills[index],
                                        color: mainColor,
                                      ),
                                      SizedBox(
                                        width: widthRation(context, 8),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          registrationCubit.removeSkill(index);
                                        },
                                        child: const Icon(
                                          Icons.close_rounded,
                                          size: 12,
                                          color: mainColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                            3,
                            (index) => Row(
                                  children: [
                                    Checkbox(
                                      value: registrationCubit
                                          .socialMediaCheck[index],
                                      onChanged: (value) {
                                        registrationCubit
                                            .changeSocialMediaCheck(index);
                                      },
                                    ),
                                    Image.asset(
                                      registrationCubit.socialMediaLogo[index],
                                      width: widthRation(context, 20),
                                    ),
                                    SizedBox(
                                      width: widthRation(context, 8),
                                    ),
                                    TextBody16(
                                      registrationCubit.socialMediaTitle[index],
                                    ),
                                  ],
                                )),
                      ),
                    ),
                    SizedBox(
                      height: heightRation(context, 32),
                    ),
                    CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          registrationCubit.showErrorMessage(false);
                          registrationCubit.registration(context);
                        }
                      },
                      child: SizedBox(
                          height: heightRation(context, 56),
                          child: const Center(
                            child: TextBody16(
                              'Submit',
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/Core/components/CustomWidgets/my_time_line_widget.dart';
import 'package:hiring_task/Registration/Presentation/Controllers/registration_cubit.dart';
import 'package:hiring_task/Registration/Presentation/Screens/second_register_screen.dart';

import '../../../Core/components/CustomWidgets/customTextFormField.dart';
import '../../../Core/components/CustomWidgets/custom_Button.dart';
import '../../../Core/components/CustomWidgets/custom_scaffold.dart';
import '../Components/register_components_widget.dart';
import '../../../Core/constants/colors.dart';
import '../../../Core/constants/responsive.dart';
import '../../../Core/constants/text.dart';

class FirstRegisterScreen extends StatelessWidget {
  const FirstRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return CustomScaffold(
      appBar: AppBar(
        title: const TextTitle(
          'Register',
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
                            isCurrent: true,
                          ),
                        ),
                        Expanded(
                          child: MyTimeLineOrder(
                            title: 'Complete Data',
                            index: '2',
                            isNotCompleted: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightRation(context, 32),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RegisterComponentsWidget(
                            title: 'First Name',
                            child: CustomTextFormField(
                              controller: firstNameController,
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
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widthRation(context, 12),
                        ),
                        Expanded(
                          child: RegisterComponentsWidget(
                            title: 'Last Name',
                            child: CustomTextFormField(
                              controller: lastNameController,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightRation(context, 16),
                    ),
                    RegisterComponentsWidget(
                      title: 'Email Address',
                      child: CustomTextFormField(
                        controller: emailController,
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
                      ),
                    ),
                    SizedBox(
                      height: heightRation(context, 16),
                    ),
                    RegisterComponentsWidget(
                      title: 'Password',
                      child: CustomTextFormField(
                        controller: passwordController,
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
                        isPassword: registrationCubit.hiddenPassword,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            child: registrationCubit.hiddenPassword
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
                              registrationCubit.changeShowPassword();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightRation(context, 8),
                    ),
                    RegisterComponentsWidget(
                      title: 'Confirm Password',
                      child: CustomTextFormField(
                        controller: confirmPasswordController,
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
                        isPassword: registrationCubit.hiddenConfirmPassword,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            child: registrationCubit.hiddenConfirmPassword
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
                              registrationCubit.changeShowConfirmPassword();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightRation(context, 16),
                    ),
                    RegisterComponentsWidget(
                      title: 'User Type',
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 24),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xffC3C5C8),
                              size: 28,
                            ),
                            underline: Container(),
                            dropdownColor: backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            value: registrationCubit.userType,
                            onChanged: (String? value) {
                              if (value != null) {}
                            },
                            items: List.generate(
                              registrationCubit.userTypes.length,
                              (index) => DropdownMenuItem(
                                value: registrationCubit.userTypes[index],
                                child: TextBody16(
                                  registrationCubit.userTypes[index],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              registrationCubit.showErrorMessage(false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SecondRegisterScreen()));
                            }
                          },
                          child: SizedBox(
                              height: heightRation(context, 56),
                              width: widthRation(context, 160),
                              child: const Center(
                                child: TextBody16(
                                  'Next',
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ],
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

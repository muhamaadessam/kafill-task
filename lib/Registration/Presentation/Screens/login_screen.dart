import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/Core/components/CustomWidgets/customTextFormField.dart';
import 'package:hiring_task/Core/components/CustomWidgets/custom_Button.dart';
import 'package:hiring_task/Core/components/CustomWidgets/custom_scaffold.dart';
import 'package:hiring_task/Registration/Presentation/Components/register_components_widget.dart';
import 'package:hiring_task/Core/constants/colors.dart';
import 'package:hiring_task/Core/constants/responsive.dart';
import 'package:hiring_task/Core/constants/text.dart';
import 'package:hiring_task/Registration/Presentation/Controllers/registration_cubit.dart';
import 'package:hiring_task/Registration/Presentation/Screens/first_register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return CustomScaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
              RegistrationCubit registrationCubit =
                  RegistrationCubit.get(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.paddingOf(context).top,
                  ),const Row(
                    children: [
                      TextTitle('Account Login'),
                    ],
                  ),
                  SizedBox(
                    height: heightRation(context, 32),
                  ),
                  Image.asset(
                    'assets/png/Login-cuate.png',
                    height: heightRation(context, 225),
                  ),
                  RegisterComponentsWidget(
                    title: 'Email Address',
                    child: CustomTextFormField(
                      controller: emailController,
                      fillColor: textInputColor,
                      color: Colors.transparent,
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
                      isPassword: registrationCubit.hiddenPassword,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            registrationCubit.changeShowPassword();
                          },
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
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightRation(context, 8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: registrationCubit.rememberMe,
                              onChanged: (value) {
                                registrationCubit.changeRememberMe();
                              }),
                          TextBody16(
                            'Remember me',
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: TextBody16(
                          'Forgot Password?',
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightRation(context, 32),
                  ),
                  CustomButton(
                    onPressed: () {
                      registrationCubit.login(
                        context,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                    child: SizedBox(
                        height: heightRation(context, 56),
                        child: const Center(
                          child: TextTitle(
                            'Login',
                            color: Colors.white,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: heightRation(context, 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextTitle(
                        'Don’t have an account?  ',
                        color: Colors.grey.shade500,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const FirstRegisterScreen()));
                        },
                        child: const TextTitle(
                          'Register',
                          color: mainColor,
                        ),
                      ),
                    ],
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

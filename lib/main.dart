import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/Countries/Presentation/Controllers/countries_cubit.dart';
import 'package:hiring_task/Registration/Presentation/Controllers/registration_cubit.dart';
import 'package:hiring_task/Registration/Presentation/Screens/login_screen.dart';

import 'BottomNavBar/Presentation/Controllers/nav_bar_cubit.dart';

import 'Core/constants/colors.dart';
import 'WhoAmI/Presentation/Controllers/who_am_i_cubit.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(create: (context) => RegistrationCubit()),
        BlocProvider(create: (context) => WhoAmICubit()),
        BlocProvider(create: (context) => CountriesCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: mainColor)),
        debugShowCheckedModeBanner: false,
        title: 'Hiring Task',
        home: const LoginScreen(),
      ),
    );
  }
}

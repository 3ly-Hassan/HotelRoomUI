import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_geeks/data/network_service.dart';
import 'package:office_geeks/data/repository.dart';
import 'package:office_geeks/user_cubit/user_cubit.dart';
import 'package:office_geeks/utility/light_theme.dart';
import 'package:office_geeks/views/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserCubit(
            repository: Repository(networkService: NetworkService()))
          ..getHotel();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Office Geeks',
          theme: lightTheme,
          home: const MainScreen()),
    );
  }
}

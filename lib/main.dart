import 'package:bloc_first/application/bloc/user_bloc.dart';
import 'package:bloc_first/domain/db/userDbService.dart';
import 'package:bloc_first/presentation/ui/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  UserDBService.registerAdapter();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => UserBloc()))],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

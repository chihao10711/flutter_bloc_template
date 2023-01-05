import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String homeScreen = "/home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Home screen")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.brightness_6),
        onPressed: () {
          context.read<AppSettingsCubit>().toggleTheme();
        },
      ),
    );
  }
}

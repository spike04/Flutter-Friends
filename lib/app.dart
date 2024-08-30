import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_friends/favorites/favorites.dart';
import 'package:flutter_friends/launchpad/launchpad.dart';
import 'package:flutter_friends/theme/theme.dart';
import 'package:flutter_friends/updater/updater.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => FavoritesCubit()),
        BlocProvider(create: (_) => UpdaterCubit()..init()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(
      (ThemeCubit cubit) => cubit.state.toThemeMode(),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UpdaterListener(child: LaunchpadPage()),
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

extension on ThemeState {
  ThemeMode toThemeMode() {
    return this == ThemeState.light ? ThemeMode.light : ThemeMode.dark;
  }
}

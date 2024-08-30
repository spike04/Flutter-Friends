import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_friends/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  if (kDebugMode) await HydratedBloc.storage.clear();
  // FIREBASE INITIALIZATION
  runApp(const App());
}

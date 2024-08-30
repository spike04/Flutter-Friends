import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_friends/updater/updater.dart';
import 'package:restart_app/restart_app.dart';

class UpdaterListener extends StatelessWidget {
  const UpdaterListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [
      BlocListener<UpdaterCubit, UpdaterState>(
        listenWhen: (previous, current) =>
            previous.status == UpdaterStatus.downloadInProgress &&
            current.status == UpdaterStatus.idle &&
            current.isNewPatchReadyToInstall,
        listener: (context, state) {
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(
              const MaterialBanner(
                content: Text('An Update is available'),
                actions: [
                  TextButton(
                    onPressed: Restart.restartApp,
                    child: Text('Restart Now'),
                  ),
                ],
              ),
            );
        },
      ),
    ], child: child);
  }
}

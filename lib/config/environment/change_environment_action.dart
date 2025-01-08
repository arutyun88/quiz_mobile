import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_mobile/config/di/di.dart';
import 'package:quiz_mobile/config/environment/environment.dart';
import 'package:quiz_mobile/config/environment/environment_provider.dart';

const int _closeTime = 3;

void changeEnvironmentAction(
  BuildContext context, {
  required Environment env,
}) async {
  await getIt.get<EnvironmentProvider>().saveEnvironment(env);
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Новое окружение: ${env.name}.'
        '\nПриложение закроется через $_closeTime секунды',
      ),
      duration: const Duration(seconds: _closeTime),
    ),
  );

  Future.delayed(const Duration(seconds: _closeTime), () => exit(0));
}

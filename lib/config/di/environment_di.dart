part of 'di.dart';

Future<void> _initEnvironmentDi() async {
  getIt.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());

  getIt.registerSingletonWithDependencies<EnvironmentStorage>(
    () => EnvironmentStorage(prefs: getIt<SharedPreferences>()),
    dependsOn: [SharedPreferences],
  );

  getIt.registerSingletonAsync<EnvironmentProvider>(
    () async {
      final provider = EnvironmentProvider(storage: getIt<EnvironmentStorage>());
      await provider.loadEnvironment();
      return provider;
    },
    dependsOn: [EnvironmentStorage],
  );
  await getIt.allReady();
}

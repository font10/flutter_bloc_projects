import 'package:flutter_bloc_projects/di/auth/auth_injection.dart';
import 'package:flutter_bloc_projects/di/shared/shared_injection.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> configureInjection() async {
  await configureAuthInjection(sl);
  await configureSharedInjection(sl);
}

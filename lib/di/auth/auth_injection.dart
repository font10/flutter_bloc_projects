import 'package:flutter_bloc_projects/projects/auth_supabase/features/data/datasource/remote/auth_remote_datasource.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/data/datasource/remote/auth_remote_datasource_impl.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/data/repositories/auth_repo_impl.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/repositories/auth_repo.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/get_uuid_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/logout_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/reset_password_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/save_uuid_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/sign_in_up_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> configureAuthInjection(GetIt sl) async {
  //? Bloc -- Auth
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(
        signInUpUc: sl(),
        logoutUc: sl(),
        resetPasswordUc: sl(),
        saveUuidUc: sl(),
      ));

  sl.registerLazySingleton<LoginFormBloc>(() => LoginFormBloc());
  sl.registerLazySingleton<SignUpFormBloc>(() => SignUpFormBloc());

  //? Usecase -- Auth
  sl.registerLazySingleton<SignInUpUc>(() => SignInUpUc(sl()));
  sl.registerLazySingleton<LogoutUc>(() => LogoutUc(sl()));
  sl.registerLazySingleton<ResetPasswordUc>(() => ResetPasswordUc(sl()));
  sl.registerLazySingleton<SaveUuidUc>(() => SaveUuidUc(sl()));
  sl.registerLazySingleton<GetUuidUc>(() => GetUuidUc(sl()));

  //? Repository -- Auth
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        remoteDataSource: sl(),
      ));

  //? Datasource -- Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDatasourceImpl(
        supabaseClient: sl(),
      ));
}

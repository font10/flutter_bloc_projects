import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/data/datasource/remote/auth_remote_datasource.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/repositories/auth_repo.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepoImpl({required AuthRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Failure, String>> signUp(AuthParamsEntity params) async {
    if (!await InternetConnection().hasInternetAccess) {
      return const Left(Failure('No Internet Connection'));
    }

    try {
      final String response = await _remoteDataSource.signUp(params);
      return Right(response);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, String>> login(AuthParamsEntity params) async {
    if (!await InternetConnection().hasInternetAccess) {
      return const Left(Failure('No Internet Connection'));
    }

    try {
      final String response = await _remoteDataSource.login(params);
      return Right(response);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (!await InternetConnection().hasInternetAccess) {
      return const Left(Failure('No Internet Connection'));
    }

    try {
      await _remoteDataSource.logout();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _remoteDataSource.resetPassword(email);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Stream<User?> authStateChange() {
    final Stream<User?> stream = _remoteDataSource.authStateChanged();
    return stream;
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final User? user = await _remoteDataSource.getCurrentUser();
      return Right(user);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return const Left(Failure('Something went wrong'));
    }
  }
}

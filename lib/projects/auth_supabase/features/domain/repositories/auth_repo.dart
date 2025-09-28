import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signUp(AuthParamsEntity params);
  Future<Either<Failure, String>> login(AuthParamsEntity params);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> resetPassword(String email);
  Stream<User?> authStateChange();
  Future<Either<Failure, User?>> getCurrentUser();
}

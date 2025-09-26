import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/repositories/auth_repo.dart';

class SignInUpUc {
  final AuthRepo _authRepo;
  SignInUpUc(this._authRepo);

  Future<Either<Failure, String>> call({required AuthParamsEntity params, required bool isSignIn}) async {
    return isSignIn ? await _authRepo.login(params) : await _authRepo.signUp(params);
  }
}

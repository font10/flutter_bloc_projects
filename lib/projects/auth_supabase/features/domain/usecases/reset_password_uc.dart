import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/repositories/auth_repo.dart';

class ResetPasswordUc {
  final AuthRepo _authRepo;
  ResetPasswordUc(this._authRepo);

  Future<Either<Failure, void>> call(String email) async {
    return await _authRepo.resetPassword(email);
  }
}

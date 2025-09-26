import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/repositories/auth_repo.dart';

class LogoutUc {
  final AuthRepo _authRepo;
  LogoutUc(this._authRepo);

  Future<Either<Failure, void>> call() async {
    return await _authRepo.logout();
  }
}

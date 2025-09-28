import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetSignedUserUc {
  final AuthRepo authRepo;

  GetSignedUserUc(this.authRepo);

  Future<Either<Failure, User?>> call() async {
    return await authRepo.getCurrentUser();
  }
}

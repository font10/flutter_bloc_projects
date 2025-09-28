import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthStateChangeUc {
  final AuthRepo _authRepo;

  AuthStateChangeUc(this._authRepo);

  Stream<User?> call() {
    return _authRepo.authStateChange();
  }
}

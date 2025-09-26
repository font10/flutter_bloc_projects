import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';

abstract class AuthRemoteDataSource {
  Future<String> signUp(AuthParamsEntity params);
  Future<String> login(AuthParamsEntity params);
  Future<void> logout();
  Future<void> resetPassword(String email);
}

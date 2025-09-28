import 'package:flutter_bloc_projects/projects/auth_supabase/features/data/datasource/remote/auth_remote_datasource.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDatasourceImpl({required this.supabaseClient});

  @override
  Future<String> signUp(AuthParamsEntity params) async {
    final response = await supabaseClient.auth.signUp(email: params.email, password: params.password);
    print(response);

    return response.user?.id ?? '';
  }

  @override
  Future<String> login(AuthParamsEntity params) async {
    final response = await supabaseClient.auth.signInWithPassword(email: params.email, password: params.password);

    return response.user?.id ?? '';
  }

  @override
  Future<void> logout() async {
    return await supabaseClient.auth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    return await supabaseClient.auth.resetPasswordForEmail(email);
  }

  @override
  Stream<User?> authStateChanged() {
    return supabaseClient.auth.onAuthStateChange.map((event) => event.session?.user);
  }

  @override
  Future<User?> getCurrentUser() async {
    return supabaseClient.auth.currentUser;
  }
}

//eyJhbGciOiJIUzI1NiIsImtpZCI6Ik15TmNQTVR5b1ZncjdzUTkiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3Rzb2h0Znp2eGplaXRoeHVlY3NvLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiI1ZWU5ZTg1OC1jMjNhLTQwN2YtYmI4ZC1kMGRmODY4MTRkYjEiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzU0NTY5ODcyLCJpYXQiOjE3NTQ1NjYyNzIsImVtYWlsIjoia3VtYUBtYWlsLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJrdW1hQG1haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiNWVlOWU4NTgtYzIzYS00MDdmLWJiOGQtZDBkZjg2ODE0ZGIxIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NTQ1NjYyNzJ9XSwic2Vzc2lvbl9pZCI6IjNkMWVlMTAzLTVhY2YtNDI0Yi1iM2NhLWYyOTkyNDUwYTc1MSIsImlzX2Fub255bW91cyI6ZmFsc2V9.bNDvl0gPYaI7NnUkK84CtPa51Um4T4xZEcD2_9E0wQ0

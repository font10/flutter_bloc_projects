import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';

class AuthParamsModel extends AuthParamsEntity {
  AuthParamsModel({required super.email, required super.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

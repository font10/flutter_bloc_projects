import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> configureSharedInjection(GetIt sl) async {
  //? Supabase client
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  //? Secure storage
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  /*//? Dio provider
  sl.registerLazySingleton<Dio>(() => DioProvider().getDio(
    null,
  ));*/

  // Supabase initialize
  await Supabase.initialize(
      url: "https://tsohtfzvxjeithxuecso.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzb2h0Znp2eGplaXRoeHVlY3NvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ4Mzc2OTMsImV4cCI6MjA2MDQxMzY5M30.YIGfG9AZybmqaIRBD2m4nJEXc-N3Bg_nDfxX29-jY9c");
}

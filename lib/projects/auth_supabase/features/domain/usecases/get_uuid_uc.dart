import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetUuidUc {
  final FlutterSecureStorage secureStorage;
  const GetUuidUc(this.secureStorage);

  Future<String> call() async {
    try {
      final String? uuid = await secureStorage.read(key: 'uuid');
      return uuid ?? '';
    } catch (e) {
      print(e);
      return '';
    }
  }
}
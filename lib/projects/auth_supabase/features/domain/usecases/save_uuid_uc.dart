import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SaveUuidUc {
  final FlutterSecureStorage secureStorage;
  const SaveUuidUc(this.secureStorage);

  Future<void> call(String uuid) async {
    await secureStorage.write(key: 'uuid', value: uuid);
  }
}
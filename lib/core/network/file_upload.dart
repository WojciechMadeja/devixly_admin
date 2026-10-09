import 'dart:typed_data';

import 'package:background_devixly_client/background_devixly_client.dart';

/// Wysyła plik do storage backendu na podstawie opisu wgrania otrzymanego z
/// endpointu (np. `NewsEndpoint.createImageUpload`); `true`, gdy się udało.
typedef FileUploadFunction =
    Future<bool> Function(String uploadDescription, Uint8List bytes);

/// Prawdziwa wysyłka — `FileUploader` klienta Serverpod.
Future<bool> uploadToBackend(String uploadDescription, Uint8List bytes) =>
    FileUploader(uploadDescription).uploadByteData(ByteData.sublistView(bytes));

import 'package:devixly_admin/core/services/media_picker.dart';

import 'fixtures.dart';

/// Atrapa wyboru plików: zawsze zwraca ten sam plik z fixture'ów.
class FakeMediaPicker implements MediaPicker {
  FakeMediaPicker({this.file, this.imageResult = const ImagePickCancelled()});

  /// Plik zwracany przez `pickFile`; domyślnie CSV z trzema użytkownikami.
  final PickedFile? file;
  final ImagePickResult imageResult;

  @override
  Future<PickedFile?> pickFile({required List<String> extensions}) async =>
      file ??
      PickedFile(name: 'users.csv', bytes: readFixtureBytes('csv/users.csv'));

  @override
  Future<ImagePickResult> pickImage() async => imageResult;
}

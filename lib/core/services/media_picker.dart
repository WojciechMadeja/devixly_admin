import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

/// Plik wybrany przez użytkownika (obrazek aktualności, plik CSV).
class PickedFile extends Equatable {
  const PickedFile({required this.name, required this.bytes});

  final String name;
  final Uint8List bytes;

  @override
  List<Object?> get props => [name, bytes];
}

/// Wynik wyboru obrazka.
sealed class ImagePickResult {
  const ImagePickResult();
}

final class ImagePicked extends ImagePickResult {
  const ImagePicked(this.file);

  final PickedFile file;
}

final class ImagePickCancelled extends ImagePickResult {
  const ImagePickCancelled();
}

/// Plik nie jest obsługiwanym obrazkiem.
final class ImagePickUnsupported extends ImagePickResult {
  const ImagePickUnsupported();
}

abstract interface class MediaPicker {
  /// Obrazek z galerii, pomniejszony do 450×450 (jak w wersji FlutterFlow).
  Future<ImagePickResult> pickImage();

  /// Dowolny plik o jednym z rozszerzeń [extensions].
  Future<PickedFile?> pickFile({required List<String> extensions});
}

class DeviceMediaPicker implements MediaPicker {
  DeviceMediaPicker({ImagePicker? imagePicker})
      : _imagePicker = imagePicker ?? ImagePicker();

  final ImagePicker _imagePicker;

  static const _supportedImageTypes = {'image/png', 'image/jpeg', 'image/gif'};

  @override
  Future<ImagePickResult> pickImage() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 450,
      maxHeight: 450,
    );
    if (image == null) return const ImagePickCancelled();
    final type = image.mimeType ?? lookupMimeType(image.name);
    if (!_supportedImageTypes.contains(type)) {
      return const ImagePickUnsupported();
    }
    return ImagePicked(
      PickedFile(name: image.name, bytes: await image.readAsBytes()),
    );
  }

  @override
  Future<PickedFile?> pickFile({required List<String> extensions}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
      withData: true,
    );
    final file = result?.files.singleOrNull;
    final bytes = file?.bytes;
    if (file == null || bytes == null) return null;
    return PickedFile(name: file.name, bytes: bytes);
  }
}

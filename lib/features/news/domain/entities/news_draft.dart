import 'package:equatable/equatable.dart';

import '../../../../core/services/media_picker.dart';
import 'news_ratio.dart';

/// Dane aktualności wysyłane z formularza dodawania lub edycji.
class NewsDraft extends Equatable {
  const NewsDraft({
    required this.title,
    required this.content,
    required this.author,
    required this.ratio,
    required this.categoryIds,
    required this.date,
    this.image,
  });

  final String title;
  final String content;
  final String author;
  final NewsRatio ratio;
  final List<int> categoryIds;

  /// Data w formacie API (`y-MM-d`); pusta, gdy nie wybrano.
  final String date;

  /// Nowy obrazek; `null` — bez obrazka (dodawanie) albo bez zmiany (edycja).
  final PickedFile? image;

  @override
  List<Object?> get props => [
    title,
    content,
    author,
    ratio,
    categoryIds,
    date,
    image,
  ];
}

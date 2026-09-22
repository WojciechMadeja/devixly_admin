import 'package:equatable/equatable.dart';

/// Dane jednostki (mieszkania) z formularza „Dodaj jednostkę”.
class UnitDraft extends Equatable {
  const UnitDraft({
    required this.apartmentNumber,
    required this.price,
    required this.ownerLastName,
    required this.phoneNumber,
  });

  final String apartmentNumber;
  final String price;
  final String ownerLastName;
  final String phoneNumber;

  @override
  List<Object?> get props =>
      [apartmentNumber, price, ownerLastName, phoneNumber];
}

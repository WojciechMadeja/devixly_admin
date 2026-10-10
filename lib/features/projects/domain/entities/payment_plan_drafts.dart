import 'package:equatable/equatable.dart';

/// Nowy plan płatności projektu.
class PaymentPlanDraft extends Equatable {
  const PaymentPlanDraft({
    required this.projectId,
    required this.name,
    this.description = '',
    this.postHandover = false,
  });

  final int projectId;
  final String name;
  final String description;

  /// Plan z płatnościami po odbiorze kluczy.
  final bool postHandover;

  @override
  List<Object?> get props => [projectId, name, description, postHandover];
}

/// Nowa rata planu płatności.
class PaymentItemDraft extends Equatable {
  const PaymentItemDraft({
    required this.paymentPlanId,
    required this.name,
    this.description = '',
  });

  final int paymentPlanId;
  final String name;
  final String description;

  @override
  List<Object?> get props => [paymentPlanId, name, description];
}

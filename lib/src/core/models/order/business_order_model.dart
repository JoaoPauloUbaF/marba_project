import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/address/address.dart';

import 'business_order_item.dart';

part 'business_order_model.freezed.dart';
part 'business_order_model.g.dart';

@freezed
class BusinessOrder with _$BusinessOrder {
  factory BusinessOrder({
    required String id,
    required String businessId,
    required String userNickname,
    required AddressModel address,
    required Set<BusinessOrderItem> items,
    required BusinessOrderStatus status,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    DateTime? canceledAt,
  }) = _BusinessOrder;

  factory BusinessOrder.fromJson(Map<String, dynamic> json) =>
      _$BusinessOrderFromJson(json);
}

enum BusinessOrderStatus {
  waitingConfirmation,
  accepted,
  preparing,
  delivering,
  delivered,
  done,
  canceled,
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}

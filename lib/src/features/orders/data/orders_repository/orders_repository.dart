import 'package:project_marba/src/core/models/order/business_order_item.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';

import '../../../../core/models/order/order_model.dart';

/// Repository interface for managing general order operations.
abstract class OrdersRepository {
  /// Places a new order in the repository.
  ///
  /// [order]: The [OrderModel] object representing the new order to place.
  /// [userId]: The ID of the user placing the order.
  /// [businessId]: The ID of the business associated with the order.
  ///
  /// Returns the ID of the newly placed order.
  Future<String> saveOrder({required OrderModel order});

  /// Retrieves a specific order by its ID.
  ///
  /// [orderId]: The ID of the order to retrieve.
  ///
  /// Returns the [OrderModel] object corresponding to the given ID.
  Future<OrderModel?> getOrderById({required String orderId});

  /// Retrieves orders filtered by a specific status.
  ///
  /// [status]: The status to filter orders by.
  ///
  /// Returns a list of [OrderModel] objects with the specified status.
  Future<List<OrderModel>> getOrdersByStatus({required String status});

  /// Updates the status of an existing order in the repository.
  ///
  /// [orderId]: The ID of the order to update.
  /// [newStatus]: The new status to set for the order.
  ///
  /// Throws an exception if the order with the specified ID is not found.
  Future<void> updateOrderStatus(
      {required String orderId, required String newStatus});

  /// Cancels an existing order in the repository.
  ///
  /// [orderId]: The ID of the order to cancel.
  ///
  /// Throws an exception if the order with the specified ID is not found.
  Future<void> cancelOrder({required String orderId});

  /// Completes an existing order in the repository.
  ///
  /// [orderId]: The ID of the order to complete.
  ///
  /// Throws an exception if the order with the specified ID is not found.
  Future<void> completeOrder({required String orderId});

  /// Retrieves all items associated with a specific order.
  ///
  /// [orderId]: The ID of the order to retrieve items for.
  ///
  /// Returns a list of [BusinessOrderItem] objects associated with the order.

  Future<List<BusinessOrderItem>> getOrderItems({required String orderId});
}

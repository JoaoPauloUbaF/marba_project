import '../../../../core/models/order/business_order_item.dart';
import '../../../../core/models/order/business_order_model.dart';

/// Repository interface for managing business orders.
abstract class BusinessOrdersRepository {
  /// Retrieves a list of all business orders.
  ///
  /// Returns a list of [BusinessOrder] objects.
  Stream<List<BusinessOrder>> getOrders({required String? businessId});

  /// Adds a new business order to the repository.
  ///
  /// [order]: The [BusinessOrder] object to add.
  Future<void> addOrder({required BusinessOrder order});

  /// Updates an existing business order in the repository.
  ///
  /// [order]: The updated [BusinessOrder] object.
  Future<void> updateOrder({required BusinessOrder order});

  /// Deletes a business order from the repository.
  ///
  /// [orderId]: The ID of the order to delete.
  Future<void> deleteOrder({required String orderId});

  /// Retrieves a specific business order by its ID.
  ///
  /// [orderId]: The ID of the order to retrieve.
  ///
  /// Returns the [BusinessOrder] object corresponding to the given ID.
  Stream<BusinessOrder?> getBusinessOrderById({required String orderId});

  /// Updates the status of an existing business order in the repository.
  ///
  /// [orderId]: The ID of the order to update.
  /// [newStatus]: The new status to set for the order.
  ///
  /// Throws an exception if the order with the specified ID is not found.
  Future<void> updateOrderStatus(
      {required String orderId, required String newStatus});

  /// Retrieves orders filtered by a specific status.
  ///
  /// [status]: The status to filter orders by.
  ///
  /// Returns a list of [BusinessOrder] objects with the specified status.
  Stream<List<BusinessOrder>> getOrdersByStatus(
      {required String status, required String businessId});

  /// Retrieves orders placed by a specific customer.
  ///
  /// [customerId]: The ID of the customer whose orders to retrieve.
  ///
  /// Returns a list of [BusinessOrder] objects placed by the specified customer.
  Future<List<BusinessOrder>> getOrdersByCustomer({required String customerId});

  /// Retrieves orders placed within a specific date range.
  ///
  /// [startDate]: The start date of the range.
  /// [endDate]: The end date of the range.
  ///
  /// Returns a list of [BusinessOrder] objects placed within the specified date range.
  Future<List<BusinessOrder>> getOrdersByDateRange(
      {required DateTime startDate, required DateTime endDate});

  /// Calculates the total value of all orders placed within a specific date range.
  ///
  /// [startDate]: The start date of the range.
  /// [endDate]: The end date of the range.
  ///
  /// Returns the total value of orders placed within the specified date range.
  Future<double> getTotalOrderValueByDateRange(
      {required DateTime startDate, required DateTime endDate});

  /// Retrieves a list of open orders.
  ///
  /// Returns a list of [BusinessOrder] objects with status "open".
  Stream<List<BusinessOrder>> getOpenOrders({required String businessId});

  /// Retrieves a list of closed orders.
  ///
  /// Returns a list of [BusinessOrder] objects with status "closed".
  Future<List<BusinessOrder>> getClosedOrders();

  /// Retrieves the count of orders by status.
  ///
  /// Returns a map where keys are the order statuses and values are the corresponding counts.
  Future<Map<String, int>> getOrderCountByStatus();

  /// Retrieves the total revenue generated from orders within a specific date range.
  ///
  /// [startDate]: The start date of the range.
  /// [endDate]: The end date of the range.
  ///
  /// Returns the total revenue generated from orders within the specified date range.
  Future<double> getTotalRevenueByDateRange(
      DateTime startDate, DateTime endDate);

  Future<Set<BusinessOrderItem>> getOrderItems({required String orderId});

  // Additional methods for managing orders and gathering statistics can be added here...
}

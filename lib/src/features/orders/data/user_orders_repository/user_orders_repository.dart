import '../../../../core/models/order/order_model.dart';

/// Repository interface for managing user-specific operations related to orders.
abstract class UserOrdersRepository {
  /// Retrieves orders placed by a specific user/customer.
  ///
  /// [userId]: The ID of the user/customer whose orders to retrieve.
  ///
  /// Returns a list of [OrderModel] objects placed by the specified user.
  Stream<List<OrderModel>> getUserOrders({String? lastOrderId});

  /// Retrieves open orders associated with a specific user/customer.
  ///
  /// [userId]: The ID of the user/customer whose open orders to retrieve.
  ///
  /// Returns a list of open [OrderModel] objects placed by the specified user.
  Future<List<OrderModel>> getUserOpenOrders();

  /// Retrieves closed orders associated with a specific user/customer.
  ///
  /// [userId]: The ID of the user/customer whose closed orders to retrieve.
  ///
  /// Returns a list of closed [OrderModel] objects placed by the specified user.
  Future<List<OrderModel>> getUserClosedOrders();

  /// Retrieves the total number of orders placed by a specific user.
  ///
  /// [userId]: The ID of the user/customer.
  ///
  /// Returns the total number of orders placed by the specified user.
  Future<int> getUserOrderCount();

  /// Retrieves sales data from closed orders for a specific user/customer.
  ///
  /// [userId]: The ID of the user/customer.
  ///
  /// Returns a map containing sales data including total revenue, total number of orders,
  /// and average order value.
  Future<Map<String, dynamic>> getUserBuyingData();

  /// Retrieves sales data from closed orders for a specific user/customer within a given date range.
  ///
  /// [userId]: The ID of the user/customer.
  /// [startDate]: The start date of the date range.
  /// [endDate]: The end date of the date range.
  ///
  /// Returns a map containing sales data including total revenue, total number of orders,
  /// and average order value within the specified date range.
  Future<Map<String, dynamic>> getBuyingDataByUserAndDateRange(
      DateTime startDate, DateTime endDate);
}

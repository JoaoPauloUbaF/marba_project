import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong.'**
  String get something_went_wrong;

  /// No description provided for @fill_all_fields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all fields correctly.'**
  String get fill_all_fields;

  /// No description provided for @mandatory_fields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all mandatory fields.'**
  String get mandatory_fields;

  /// No description provided for @error_loading_data.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get error_loading_data;

  /// No description provided for @no_results_found.
  ///
  /// In en, this message translates to:
  /// **'No results found!'**
  String get no_results_found;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get back;

  /// No description provided for @search_greetings.
  ///
  /// In en, this message translates to:
  /// **'How can we help?'**
  String get search_greetings;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for products, services and business!'**
  String get search_hint;

  /// No description provided for @seen_recently.
  ///
  /// In en, this message translates to:
  /// **'Seen Recently'**
  String get seen_recently;

  /// No description provided for @popular_services.
  ///
  /// In en, this message translates to:
  /// **'Popular Services'**
  String get popular_services;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @create_business.
  ///
  /// In en, this message translates to:
  /// **'Create Business'**
  String get create_business;

  /// No description provided for @delete_business.
  ///
  /// In en, this message translates to:
  /// **'Delete business'**
  String get delete_business;

  /// No description provided for @delete_business_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this business?'**
  String get delete_business_confirmation;

  /// No description provided for @error_creating_business.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while creating the business. Please try again.'**
  String get error_creating_business;

  /// No description provided for @change_address.
  ///
  /// In en, this message translates to:
  /// **'Change Address'**
  String get change_address;

  /// No description provided for @basic_information.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basic_information;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @categories_and_fees.
  ///
  /// In en, this message translates to:
  /// **'Categories and Fees'**
  String get categories_and_fees;

  /// No description provided for @business_status.
  ///
  /// In en, this message translates to:
  /// **'Business Status'**
  String get business_status;

  /// No description provided for @open_hours.
  ///
  /// In en, this message translates to:
  /// **'Opening Hours'**
  String get open_hours;

  /// No description provided for @no_hours_registered.
  ///
  /// In en, this message translates to:
  /// **'No hours registered'**
  String get no_hours_registered;

  /// No description provided for @error_updating_open_hours.
  ///
  /// In en, this message translates to:
  /// **'There was an error updating the hours'**
  String get error_updating_open_hours;

  /// No description provided for @min_order.
  ///
  /// In en, this message translates to:
  /// **'Minimum Order'**
  String get min_order;

  /// No description provided for @accept_order.
  ///
  /// In en, this message translates to:
  /// **'Accept Order'**
  String get accept_order;

  /// No description provided for @no_order_found.
  ///
  /// In en, this message translates to:
  /// **'No orders found'**
  String get no_order_found;

  /// No description provided for @error_loading_order.
  ///
  /// In en, this message translates to:
  /// **'Error loading order: '**
  String get error_loading_order;

  /// No description provided for @total_items.
  ///
  /// In en, this message translates to:
  /// **'Total items: '**
  String get total_items;

  /// No description provided for @total_sales.
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get total_sales;

  /// No description provided for @total_costs.
  ///
  /// In en, this message translates to:
  /// **'Total Costs'**
  String get total_costs;

  /// No description provided for @total_profit.
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get total_profit;

  /// No description provided for @no_sales_found.
  ///
  /// In en, this message translates to:
  /// **'No sales found.'**
  String get no_sales_found;

  /// No description provided for @error_fetching_sales.
  ///
  /// In en, this message translates to:
  /// **'Error fetching sales data.'**
  String get error_fetching_sales;

  /// No description provided for @base_delivery_fee.
  ///
  /// In en, this message translates to:
  /// **'Base Delivery Fee'**
  String get base_delivery_fee;

  /// No description provided for @delivery_settings.
  ///
  /// In en, this message translates to:
  /// **'Delivery Settings'**
  String get delivery_settings;

  /// No description provided for @distance_surcharge.
  ///
  /// In en, this message translates to:
  /// **'Surcharge by Distance'**
  String get distance_surcharge;

  /// No description provided for @additional_fee_per_km.
  ///
  /// In en, this message translates to:
  /// **'Additional fee per exceeded km'**
  String get additional_fee_per_km;

  /// No description provided for @base_distance.
  ///
  /// In en, this message translates to:
  /// **'Base Distance'**
  String get base_distance;

  /// No description provided for @min_delivery_time.
  ///
  /// In en, this message translates to:
  /// **'Minimum Delivery Time'**
  String get min_delivery_time;

  /// No description provided for @max_delivery_time.
  ///
  /// In en, this message translates to:
  /// **'Maximum Delivery Time'**
  String get max_delivery_time;

  /// No description provided for @min_order_value.
  ///
  /// In en, this message translates to:
  /// **'Minimum Order Value'**
  String get min_order_value;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @register_business.
  ///
  /// In en, this message translates to:
  /// **'I want to register my Business'**
  String get register_business;

  /// No description provided for @creation_success.
  ///
  /// In en, this message translates to:
  /// **'Successfully created!'**
  String get creation_success;

  /// No description provided for @offer.
  ///
  /// In en, this message translates to:
  /// **'Offer'**
  String get offer;

  /// No description provided for @offer_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Successfully created!'**
  String get offer_created_successfully;

  /// No description provided for @edit_offer.
  ///
  /// In en, this message translates to:
  /// **'Your offer has been edited!'**
  String get edit_offer;

  /// No description provided for @product_service_offer.
  ///
  /// In en, this message translates to:
  /// **'Is your offer a product or service?'**
  String get product_service_offer;

  /// No description provided for @offer_data.
  ///
  /// In en, this message translates to:
  /// **'Offer Data'**
  String get offer_data;

  /// No description provided for @add_more_media.
  ///
  /// In en, this message translates to:
  /// **'Add more media'**
  String get add_more_media;

  /// No description provided for @apply_filters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get apply_filters;

  /// No description provided for @clear_filters.
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get clear_filters;

  /// No description provided for @error_loading_offers.
  ///
  /// In en, this message translates to:
  /// **'Error loading offers'**
  String get error_loading_offers;

  /// No description provided for @no_offer_found.
  ///
  /// In en, this message translates to:
  /// **'No offers found'**
  String get no_offer_found;

  /// No description provided for @no_offers_visited.
  ///
  /// In en, this message translates to:
  /// **'You have not visited any offers!'**
  String get no_offers_visited;

  /// No description provided for @delete_review.
  ///
  /// In en, this message translates to:
  /// **'Delete Review'**
  String get delete_review;

  /// No description provided for @delete_review_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this review?'**
  String get delete_review_confirmation;

  /// No description provided for @no_reviews_found.
  ///
  /// In en, this message translates to:
  /// **'No reviews found'**
  String get no_reviews_found;

  /// No description provided for @end_of_reviews.
  ///
  /// In en, this message translates to:
  /// **'End of reviews'**
  String get end_of_reviews;

  /// No description provided for @error_loading_reviews.
  ///
  /// In en, this message translates to:
  /// **'Error loading reviews'**
  String get error_loading_reviews;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get order;

  /// No description provided for @checkout_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get checkout_products;

  /// No description provided for @login_to_see_orders.
  ///
  /// In en, this message translates to:
  /// **'Log in to see your orders.'**
  String get login_to_see_orders;

  /// No description provided for @no_orders_found.
  ///
  /// In en, this message translates to:
  /// **'No orders found.'**
  String get no_orders_found;

  /// No description provided for @order_not_found.
  ///
  /// In en, this message translates to:
  /// **'Order not found'**
  String get order_not_found;

  /// No description provided for @cart_empty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty.'**
  String get cart_empty;

  /// No description provided for @quantity_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable quantity'**
  String get quantity_unavailable;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @empty_cart.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty.'**
  String get empty_cart;

  /// No description provided for @credit_card.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get credit_card;

  /// No description provided for @new_credit_card.
  ///
  /// In en, this message translates to:
  /// **'New Credit Card'**
  String get new_credit_card;

  /// No description provided for @add_credit_card.
  ///
  /// In en, this message translates to:
  /// **'Credit Card Added'**
  String get add_credit_card;

  /// No description provided for @delete_card.
  ///
  /// In en, this message translates to:
  /// **'Delete Card'**
  String get delete_card;

  /// No description provided for @delete_card_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this card?'**
  String get delete_card_confirmation;

  /// No description provided for @pix.
  ///
  /// In en, this message translates to:
  /// **'Pix'**
  String get pix;

  /// No description provided for @boleto.
  ///
  /// In en, this message translates to:
  /// **'Boleto'**
  String get boleto;

  /// No description provided for @my_addresses.
  ///
  /// In en, this message translates to:
  /// **'My Addresses'**
  String get my_addresses;

  /// No description provided for @confirm_address.
  ///
  /// In en, this message translates to:
  /// **'Confirm Address'**
  String get confirm_address;

  /// No description provided for @delete_address.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get delete_address;

  /// No description provided for @delete_address_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this address?'**
  String get delete_address_confirmation;

  /// No description provided for @address_without_number.
  ///
  /// In en, this message translates to:
  /// **'Address without number'**
  String get address_without_number;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get number;

  /// No description provided for @neighborhood.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood'**
  String get neighborhood;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @zip_code.
  ///
  /// In en, this message translates to:
  /// **'ZIP Code'**
  String get zip_code;

  /// No description provided for @help_error.
  ///
  /// In en, this message translates to:
  /// **'Error fetching your current location'**
  String get help_error;

  /// No description provided for @select_delivery_address.
  ///
  /// In en, this message translates to:
  /// **'Select a delivery address'**
  String get select_delivery_address;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @conversations.
  ///
  /// In en, this message translates to:
  /// **'Conversations'**
  String get conversations;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @privacy_policy_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn how we protect your information'**
  String get privacy_policy_subtitle;

  /// No description provided for @terms_of_use.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get terms_of_use;

  /// No description provided for @terms_of_use_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Read our terms and conditions'**
  String get terms_of_use_subtitle;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @discount_coupon.
  ///
  /// In en, this message translates to:
  /// **'Discount Coupon'**
  String get discount_coupon;

  /// No description provided for @discount_10.
  ///
  /// In en, this message translates to:
  /// **'10% discount'**
  String get discount_10;

  /// No description provided for @search_history.
  ///
  /// In en, this message translates to:
  /// **'Search History'**
  String get search_history;

  /// No description provided for @auto_fill_fields.
  ///
  /// In en, this message translates to:
  /// **'Auto-fill fields (DEV)'**
  String get auto_fill_fields;

  /// No description provided for @preview_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera Preview'**
  String get preview_camera;

  /// No description provided for @appliances.
  ///
  /// In en, this message translates to:
  /// **'Appliances'**
  String get appliances;

  /// No description provided for @artsAndCrafts.
  ///
  /// In en, this message translates to:
  /// **'Arts and Crafts'**
  String get artsAndCrafts;

  /// No description provided for @automotive.
  ///
  /// In en, this message translates to:
  /// **'Automotive'**
  String get automotive;

  /// No description provided for @beautyAndPersonalCare.
  ///
  /// In en, this message translates to:
  /// **'Beauty and Personal Care'**
  String get beautyAndPersonalCare;

  /// No description provided for @booksAndStationery.
  ///
  /// In en, this message translates to:
  /// **'Books and Stationery'**
  String get booksAndStationery;

  /// No description provided for @clothing.
  ///
  /// In en, this message translates to:
  /// **'Clothing'**
  String get clothing;

  /// No description provided for @electronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronics;

  /// No description provided for @foodAndBeverage.
  ///
  /// In en, this message translates to:
  /// **'Food and Beverage'**
  String get foodAndBeverage;

  /// No description provided for @healthAndWellness.
  ///
  /// In en, this message translates to:
  /// **'Health and Wellness'**
  String get healthAndWellness;

  /// No description provided for @homeAndGarden.
  ///
  /// In en, this message translates to:
  /// **'Home and Garden'**
  String get homeAndGarden;

  /// No description provided for @jewelryAndAccessories.
  ///
  /// In en, this message translates to:
  /// **'Jewelry and Accessories'**
  String get jewelryAndAccessories;

  /// No description provided for @marketingAndAdvertising.
  ///
  /// In en, this message translates to:
  /// **'Marketing and Advertising'**
  String get marketingAndAdvertising;

  /// No description provided for @musicAndInstruments.
  ///
  /// In en, this message translates to:
  /// **'Music and Instruments'**
  String get musicAndInstruments;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @petSupplies.
  ///
  /// In en, this message translates to:
  /// **'Pet Supplies'**
  String get petSupplies;

  /// No description provided for @realEstate.
  ///
  /// In en, this message translates to:
  /// **'Real Estate'**
  String get realEstate;

  /// No description provided for @retail.
  ///
  /// In en, this message translates to:
  /// **'Retail'**
  String get retail;

  /// No description provided for @sportsAndOutdoors.
  ///
  /// In en, this message translates to:
  /// **'Sports and Outdoors'**
  String get sportsAndOutdoors;

  /// No description provided for @toysAndGames.
  ///
  /// In en, this message translates to:
  /// **'Toys and Games'**
  String get toysAndGames;

  /// No description provided for @mechanicServices.
  ///
  /// In en, this message translates to:
  /// **'Mechanic'**
  String get mechanicServices;

  /// No description provided for @barberServices.
  ///
  /// In en, this message translates to:
  /// **'Barber'**
  String get barberServices;

  /// No description provided for @hairdresserServices.
  ///
  /// In en, this message translates to:
  /// **'Hairdresser'**
  String get hairdresserServices;

  /// No description provided for @cleanerServices.
  ///
  /// In en, this message translates to:
  /// **'Cleaner'**
  String get cleanerServices;

  /// No description provided for @painterServices.
  ///
  /// In en, this message translates to:
  /// **'Painter'**
  String get painterServices;

  /// No description provided for @electricianServices.
  ///
  /// In en, this message translates to:
  /// **'Electrician'**
  String get electricianServices;

  /// No description provided for @plumberServices.
  ///
  /// In en, this message translates to:
  /// **'Plumber'**
  String get plumberServices;

  /// No description provided for @gardenerServices.
  ///
  /// In en, this message translates to:
  /// **'Gardener'**
  String get gardenerServices;

  /// No description provided for @bricklayerServices.
  ///
  /// In en, this message translates to:
  /// **'Bricklayer'**
  String get bricklayerServices;

  /// No description provided for @driverServices.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driverServices;

  /// No description provided for @cookServices.
  ///
  /// In en, this message translates to:
  /// **'Cook'**
  String get cookServices;

  /// No description provided for @waiterServices.
  ///
  /// In en, this message translates to:
  /// **'Waiter'**
  String get waiterServices;

  /// No description provided for @itTechnicianServices.
  ///
  /// In en, this message translates to:
  /// **'IT Technician'**
  String get itTechnicianServices;

  /// No description provided for @personalTrainerServices.
  ///
  /// In en, this message translates to:
  /// **'Personal Trainer'**
  String get personalTrainerServices;

  /// No description provided for @nutritionistServices.
  ///
  /// In en, this message translates to:
  /// **'Nutritionist'**
  String get nutritionistServices;

  /// No description provided for @dentistServices.
  ///
  /// In en, this message translates to:
  /// **'Dentist'**
  String get dentistServices;

  /// No description provided for @doctorServices.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctorServices;

  /// No description provided for @lawyerServices.
  ///
  /// In en, this message translates to:
  /// **'Lawyer'**
  String get lawyerServices;

  /// No description provided for @accountantServices.
  ///
  /// In en, this message translates to:
  /// **'Accountant'**
  String get accountantServices;

  /// No description provided for @therapistServices.
  ///
  /// In en, this message translates to:
  /// **'Therapist'**
  String get therapistServices;

  /// No description provided for @barberShopServices.
  ///
  /// In en, this message translates to:
  /// **'Barbershop'**
  String get barberShopServices;

  /// No description provided for @accountant.
  ///
  /// In en, this message translates to:
  /// **'Accountant'**
  String get accountant;

  /// No description provided for @alarmServices.
  ///
  /// In en, this message translates to:
  /// **'Alarm Services'**
  String get alarmServices;

  /// No description provided for @applianceRepair.
  ///
  /// In en, this message translates to:
  /// **'Appliance Repair'**
  String get applianceRepair;

  /// No description provided for @architect.
  ///
  /// In en, this message translates to:
  /// **'Architect'**
  String get architect;

  /// No description provided for @babysitter.
  ///
  /// In en, this message translates to:
  /// **'Babysitter'**
  String get babysitter;

  /// No description provided for @bicycleRepair.
  ///
  /// In en, this message translates to:
  /// **'Bicycle Repair'**
  String get bicycleRepair;

  /// No description provided for @cableServices.
  ///
  /// In en, this message translates to:
  /// **'Cable Services'**
  String get cableServices;

  /// No description provided for @carpenter.
  ///
  /// In en, this message translates to:
  /// **'Carpenter'**
  String get carpenter;

  /// No description provided for @cleaner.
  ///
  /// In en, this message translates to:
  /// **'Cleaner'**
  String get cleaner;

  /// No description provided for @computerRepair.
  ///
  /// In en, this message translates to:
  /// **'Computer Repair'**
  String get computerRepair;

  /// No description provided for @deliveryPerson.
  ///
  /// In en, this message translates to:
  /// **'Delivery Person'**
  String get deliveryPerson;

  /// No description provided for @dogWalker.
  ///
  /// In en, this message translates to:
  /// **'Dog Walker'**
  String get dogWalker;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @elderCareProvider.
  ///
  /// In en, this message translates to:
  /// **'Elder Care Provider'**
  String get elderCareProvider;

  /// No description provided for @electrician.
  ///
  /// In en, this message translates to:
  /// **'Electrician'**
  String get electrician;

  /// No description provided for @electricalServices.
  ///
  /// In en, this message translates to:
  /// **'Electrical Services'**
  String get electricalServices;

  /// No description provided for @eventPlanner.
  ///
  /// In en, this message translates to:
  /// **'Event Planner'**
  String get eventPlanner;

  /// No description provided for @financialPlanner.
  ///
  /// In en, this message translates to:
  /// **'Financial Planner'**
  String get financialPlanner;

  /// No description provided for @gardener.
  ///
  /// In en, this message translates to:
  /// **'Gardener'**
  String get gardener;

  /// No description provided for @glassRepair.
  ///
  /// In en, this message translates to:
  /// **'Glass Repair'**
  String get glassRepair;

  /// No description provided for @graphicDesigner.
  ///
  /// In en, this message translates to:
  /// **'Graphic Designer'**
  String get graphicDesigner;

  /// No description provided for @gutterCleaning.
  ///
  /// In en, this message translates to:
  /// **'Gutter Cleaning'**
  String get gutterCleaning;

  /// No description provided for @hairdresser.
  ///
  /// In en, this message translates to:
  /// **'Hairdresser'**
  String get hairdresser;

  /// No description provided for @airConditionerServices.
  ///
  /// In en, this message translates to:
  /// **'HVAC Services'**
  String get airConditionerServices;

  /// No description provided for @insulationServices.
  ///
  /// In en, this message translates to:
  /// **'Insulation Services'**
  String get insulationServices;

  /// No description provided for @internetServices.
  ///
  /// In en, this message translates to:
  /// **'Internet Services'**
  String get internetServices;

  /// No description provided for @interpreter.
  ///
  /// In en, this message translates to:
  /// **'Interpreter'**
  String get interpreter;

  /// No description provided for @jewelryRepair.
  ///
  /// In en, this message translates to:
  /// **'Jewelry Repair'**
  String get jewelryRepair;

  /// No description provided for @lawyer.
  ///
  /// In en, this message translates to:
  /// **'Lawyer'**
  String get lawyer;

  /// No description provided for @locksmith.
  ///
  /// In en, this message translates to:
  /// **'Locksmith'**
  String get locksmith;

  /// No description provided for @makeupArtist.
  ///
  /// In en, this message translates to:
  /// **'Makeup Artist'**
  String get makeupArtist;

  /// No description provided for @marketingConsultant.
  ///
  /// In en, this message translates to:
  /// **'Marketing Consultant'**
  String get marketingConsultant;

  /// No description provided for @mason.
  ///
  /// In en, this message translates to:
  /// **'Mason'**
  String get mason;

  /// No description provided for @masseurMassagist.
  ///
  /// In en, this message translates to:
  /// **'Masseur / Massagist'**
  String get masseurMassagist;

  /// No description provided for @nails.
  ///
  /// In en, this message translates to:
  /// **'Nails'**
  String get nails;

  /// No description provided for @nutritionist.
  ///
  /// In en, this message translates to:
  /// **'Nutritionist'**
  String get nutritionist;

  /// No description provided for @painter.
  ///
  /// In en, this message translates to:
  /// **'Painter'**
  String get painter;

  /// No description provided for @personalTrainer.
  ///
  /// In en, this message translates to:
  /// **'Personal Trainer'**
  String get personalTrainer;

  /// No description provided for @petGroomer.
  ///
  /// In en, this message translates to:
  /// **'Pet Groomer'**
  String get petGroomer;

  /// No description provided for @phoneRepair.
  ///
  /// In en, this message translates to:
  /// **'Phone Repair'**
  String get phoneRepair;

  /// No description provided for @photographer.
  ///
  /// In en, this message translates to:
  /// **'Photographer'**
  String get photographer;

  /// No description provided for @plumber.
  ///
  /// In en, this message translates to:
  /// **'Plumber'**
  String get plumber;

  /// No description provided for @poolCleaning.
  ///
  /// In en, this message translates to:
  /// **'Pool Cleaning'**
  String get poolCleaning;

  /// No description provided for @pressureWashing.
  ///
  /// In en, this message translates to:
  /// **'Pressure Washing'**
  String get pressureWashing;

  /// No description provided for @socialMediaManager.
  ///
  /// In en, this message translates to:
  /// **'Social Media Manager'**
  String get socialMediaManager;

  /// No description provided for @solarServices.
  ///
  /// In en, this message translates to:
  /// **'Solar Services'**
  String get solarServices;

  /// No description provided for @tattooArtist.
  ///
  /// In en, this message translates to:
  /// **'Tattoo Artist'**
  String get tattooArtist;

  /// No description provided for @therapist.
  ///
  /// In en, this message translates to:
  /// **'Therapist'**
  String get therapist;

  /// No description provided for @tutor.
  ///
  /// In en, this message translates to:
  /// **'Tutor'**
  String get tutor;

  /// No description provided for @upholsteryCleaning.
  ///
  /// In en, this message translates to:
  /// **'Upholstery Cleaning'**
  String get upholsteryCleaning;

  /// No description provided for @veterinarian.
  ///
  /// In en, this message translates to:
  /// **'Veterinarian'**
  String get veterinarian;

  /// No description provided for @watchRepair.
  ///
  /// In en, this message translates to:
  /// **'Watch Repair'**
  String get watchRepair;

  /// No description provided for @weddingPlanner.
  ///
  /// In en, this message translates to:
  /// **'Wedding Planner'**
  String get weddingPlanner;

  /// No description provided for @weldingServices.
  ///
  /// In en, this message translates to:
  /// **'Welding Services'**
  String get weldingServices;

  /// No description provided for @windowCleaning.
  ///
  /// In en, this message translates to:
  /// **'Window Cleaning'**
  String get windowCleaning;

  /// No description provided for @securitySystems.
  ///
  /// In en, this message translates to:
  /// **'Security Systems'**
  String get securitySystems;

  /// No description provided for @solarPanelInstallation.
  ///
  /// In en, this message translates to:
  /// **'Solar Panel Installation'**
  String get solarPanelInstallation;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

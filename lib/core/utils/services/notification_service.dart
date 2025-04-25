// import 'dart:async';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ibuild_vendor/core/router/go_route.dart';
// import 'package:ibuild_vendor/core/utils/app_utils/app_logger.dart';
// import 'package:ibuild_vendor/core/utils/app_utils/dialogs.dart';
// import 'package:ibuild_vendor/firebase_options.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:get_storage/get_storage.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await NotificationService.instance.setupFlutterNotifications();
//   await PersistentNotificationStore.instance.init();
//   NotificationService.instance.showFlutterNotification(message);
//   PersistentNotificationStore.instance.add(message);
// }

// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   static NotificationService get instance => _instance;

//   NotificationService._internal();

//   late GoRouter router;
//   late AndroidNotificationChannel channel;
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   bool isFlutterLocalNotificationsInitialized = false;

//   Future<void> init(GoRouter routerInstance) async {
//     router = routerInstance;

//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     await setupFlutterNotifications();

//     // Foreground
//     FirebaseMessaging.onMessage.listen(showFlutterNotification);

//     // Background/tapped
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

//     // Terminated state
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         _handleNotificationTap(message);
//       }
//     });
//   }

//   Future<void> setupFlutterNotifications() async {
//     if (isFlutterLocalNotificationsInitialized) return;

//     channel = const AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high,
//     );

//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/launcher_icon');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: _handleLocalNotificationTap,
//     );

//     isFlutterLocalNotificationsInitialized = true;
//   }

//   void showFlutterNotification(RemoteMessage remoteMessage) async {
//     AppLogger.logInfo(
//         "Foreground notification: ${remoteMessage.data}");

//     Map<String, dynamic> data = remoteMessage.data;
//     data['title'] = remoteMessage.notification?.title;
//     data['message'] = remoteMessage.notification?.body;
//     String title = data['title'] ?? "Power bank Returned";
//     String? orderId = data['order_id'] ?? "";
//     String message =
//         data['message'] ?? 'Your ordered Power bank has been returned';

//       _showNotificationDialog(
//         title: title,
//         orderId: orderId,
//         message: message,
//     );

//     RemoteNotification? notification = remoteMessage.notification;
//     AndroidNotification? android = remoteMessage.notification?.android;

//     if (notification != null && android != null && !kIsWeb) {
//       String? imageUrl = android.imageUrl ?? data['image'];
//       BigPictureStyleInformation? bigPictureStyle;

//       if (imageUrl != null && imageUrl.isNotEmpty) {
//         final bigPicture = await _downloadAndSaveFile(imageUrl, 'bigPicture');
//         bigPictureStyle = BigPictureStyleInformation(
//           FilePathAndroidBitmap(bigPicture),
//           contentTitle: notification.title,
//           summaryText: notification.body,
//         );
//       }

//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             icon: '@mipmap/launcher_icon',
//             styleInformation: bigPictureStyle,
//           ),
//         ),
//         payload: data.toString(),
//       );
//     }
//   }

//   void _handleNotificationTap(RemoteMessage message) {
//     Map<String, dynamic> data = message.data;
//     data['title'] = message.notification?.title;
//     data['message'] = message.notification?.body;
//     AppLogger.logInfo(
//         "App opened from background notification: ${message.notification?.title}");
//     PersistentNotificationStore.instance.add(message);
//     if (data.containsKey('route')) {
//       router.go(data['route']);
//     } else {
//       router.go(Routes.HOME);
//     }
//   }

//   void _handleLocalNotificationTap(NotificationResponse response) {
//     router.go(Routes.HOME);
//   }

//   Future<String> _downloadAndSaveFile(String url, String fileName) async {
//     final directory = await getTemporaryDirectory();
//     final filePath = '${directory.path}/$fileName';
//     final response = await http.get(Uri.parse(url));
//     final file = File(filePath);
//     await file.writeAsBytes(response.bodyBytes);
//     return filePath;
//   }

//   void _showNotificationDialog({
//     required String title,
//     required String message,
//     String? orderId,
//     double? amount,
//   }) {
//     final context = navigatorKey.currentContext;
//     ShowDialogs.showNotificationDialog(
//       context: context,
//       title: title,
//       message: message,
//       orderId: orderId,
//     );
//   }

//   bool _isDialogType(String? type) {
//     return type == 'order_success' ||
//         type == 'order_cancel' ||
//         type == 'order_delayed' ||
//         type == 'order_returned';
//   }

//   Future<void> requestPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     AppLogger.logInfo(
//         'User granted permission: ${settings.authorizationStatus}');

//     if (settings.authorizationStatus == AuthorizationStatus.authorized ||
//         settings.authorizationStatus == AuthorizationStatus.provisional) {
//       await getToken();
//     } else {
//       AppLogger.logWarning('Permission not granted for notifications.');
//     }
//   }

//   void markNotificationAsViewed(String orderId) {
//     PersistentNotificationStore.instance.removeByOrderId(orderId);
//     AppLogger.logInfo("Notification with orderId $orderId marked as viewed");
//   }

//   Future<String?> getToken({int retries = 2}) async {
//     if (Platform.isIOS) {
//       for (int attempt = 0; attempt < retries; attempt++) {
//         String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//         if (apnsToken != null) break;
//         AppLogger.logInfo('Waiting for APNs token (attempt ${attempt + 1})...');
//         await Future.delayed(const Duration(seconds: 2));
//       }

//       String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//       if (apnsToken == null) {
//         AppLogger.logError(
//             'APNs token not yet available after $retries retries.');
//         return null;
//       }
//     }

//     try {
//       final fcmToken = await FirebaseMessaging.instance.getToken();
//       AppLogger.logInfo("FCM Token: $fcmToken");
//       return fcmToken;
//     } catch (e) {
//       AppLogger.logError('Error fetching FCM token: $e');
//       return null;
//     }
//   }

//   Future<void> subscribeToTopic(String topic) async {
//     await FirebaseMessaging.instance.subscribeToTopic(topic);
//   }

//   Future<void> unsubscribeFromTopic(String topic) async {
//     await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
//   }
// }

// class PersistentNotificationStore {
//   static final PersistentNotificationStore _instance =
//       PersistentNotificationStore._internal();
//   static PersistentNotificationStore get instance => _instance;

//   static const String _storageKey = 'notifications';
//   final GetStorage _box = GetStorage();

//   List<Map<String, dynamic>> _notifications = [];

//   PersistentNotificationStore._internal();

//   /// Call this during app initialization
//   Future<void> init() async {
//     await GetStorage.init();
//     final stored = _box.read<List>(_storageKey);
//     if (stored != null) {
//       _notifications = stored.cast<Map<String, dynamic>>();
//     }
//   }

//   /// Get all notifications
//   List<Map<String, dynamic>> getAll() {
//     return List.unmodifiable(_notifications);
//   }

//   /// Add new notification
//   void add(RemoteMessage message) {
//         Map<String, dynamic> data = message.data;
//     data['title'] = message.notification?.title;
//     data['message'] = message.notification?.body;
//     _notifications.add(data);
//     _saveToStorage();
//   }

//   /// Remove notification by order ID
//   void removeByOrderId(String orderId) {
//     _notifications.removeWhere((element) => element['order_id'] == orderId);
//     _saveToStorage();
//   }

//   /// Clear all notifications
//   void clearAll() {
//     _notifications.clear();
//     _saveToStorage();
//   }

//   /// Save current list to storage
//   void _saveToStorage() {
//     _box.write(_storageKey, _notifications);
//   }
// }

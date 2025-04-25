// Notification model
class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });
}
final List<NotificationItem> notifications = [
  NotificationItem(
    id: '1',
    title: 'New Message',
    message: 'You have received a new message from John Doe',
    timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  NotificationItem(
    id: '2',
    title: 'Payment Successful',
    message: 'Your payment of \$50 was processed successfully',
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NotificationItem(
    id: '3',
    title: 'Login Attempt',
    message: 'Someone tried to log in to your account from a new device',
    timestamp: DateTime.now().subtract(const Duration(hours: 6)),
    isRead: true,
  ),
  NotificationItem(
    id: '4',
    title: 'Failed Transaction',
    message: 'Your transaction failed due to insufficient funds',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationItem(
    id: '5',
    title: 'System Update',
    message: 'App updated to version 2.0.1 with new features',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    isRead: true,
  ),
  NotificationItem(
    id: '6',
    title: 'Account Verified',
    message: 'Your account has been successfully verified',
    timestamp: DateTime.now().subtract(const Duration(days: 3)),
    isRead: true,
  ),
];

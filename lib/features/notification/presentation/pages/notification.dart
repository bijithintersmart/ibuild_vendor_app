import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/features/notification/data/models/notification_model.dart';
import 'package:intl/intl.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  void _markAsRead(String id) {
    setState(() {
      final notification = notifications.firstWhere((item) => item.id == id);
      notification.isRead = true;
    });
  }

  // Method to delete notification
  void _deleteNotification(String id) {
    setState(() {
      notifications.removeWhere((item) => item.id == id);
    });
  }

  // Method to mark all notifications as read
  // void _markAllAsRead() {
  //   setState(() {
  //     for (var notification in notifications) {
  //       notification.isRead = true;
  //     }
  //   });
  //   scaffoldToast('All notifications marked as read');
  // }

  // Method to clear all notifications
  void _clearAllNotifications() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Clear All Notifications',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
          ),
          content: Text(
            'Are you sure you want to delete all notifications?',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 35)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'CANCEL',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 35)),
                    onPressed: () {
                      setState(() {
                        notifications.clear();
                      });
                      Navigator.of(context).pop();
                      scaffoldToast('All notifications cleared');
                    },
                    child: Text(
                      'DELETE',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // Method to format timestamp
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return DateFormat('MMM d, yyyy').format(timestamp);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navController.jumpToTab(0);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: NormalText(
          text: 'Notifications',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (notifications.isNotEmpty) ...[
            // IconButton(
            //   icon: const Icon(Icons.done_all),
            //   tooltip: 'Mark all as read',
            //   onPressed: _markAllAsRead,
            // ),
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Clear all notifications',
              onPressed: _clearAllNotifications,
            ),
          ],
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(
                height: 10,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Dismissible(
                  key: Key(notification.id),
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                  secondaryBackground: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      _markAsRead(notification.id);
                      return false;
                    } else {
                      return true;
                    }
                  },
                  onDismissed: (direction) {
                    _deleteNotification(notification.id);
                    scaffoldToast(
                      'Notification deleted',
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          setState(() {
                            notifications.insert(index, notification);
                          });
                        },
                      ),
                    );
                  },
                  child: Card(
                    color: AppColors.cardGrey,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        border: notification.isRead
                            ? null
                            : Border(
                                left: BorderSide(
                                  color: primaryColor,
                                  width: 4,
                                ),
                              ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                          left: notification.isRead ? 16 : 12,
                          right: 16,
                          top: 12,
                          bottom: 12,
                        ),
                        title: Text(
                          notification.title,
                          style: TextStyle(
                            fontWeight: notification.isRead
                                ? FontWeight.normal
                                : FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              notification.message,
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _formatTimestamp(notification.timestamp),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                        isThreeLine: true,
                        onTap: () {
                          _markAsRead(notification.id);
                          scaffoldToast(
                              'Viewed notification: ${notification.title}');
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

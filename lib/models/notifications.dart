import 'package:starter_project/Salon/pages/screens/utils/utils.dart';
class AppNotification {
  String image, notification, time = '2 hours ago';
  bool isRead;

  AppNotification(this.image, this.notification, this.isRead);
}

List<AppNotification> notifications = [
  AppNotification(AvailableImages.luffy, 'Naza commented on your post: "Hello! 🔪" ', false),
  AppNotification(AvailableImages.naruto, 'Mummy commented on your post: "Hi 👊"', true),
  AppNotification(AvailableImages.natsu, 'Daddy  commented on your post: "Lol 👿"', false),
  AppNotification(AvailableImages.luffy, 'Children  commented on your post: "Sorry lol 😁"', true),
];
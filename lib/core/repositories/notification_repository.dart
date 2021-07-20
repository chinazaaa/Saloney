import 'package:flutter/material.dart';
import 'package:starter_project/core/api/api_utils/network_exceptions.dart';
import 'package:starter_project/core/api/customer_api/customer_api.dart';
import 'package:starter_project/index.dart';
import 'package:starter_project/models/api_response_variants/customer_notification_response.dart';

import '../../locator.dart';

class NotificationRepository extends BaseNotifier{
  
  final customerApi = locator<CustomerApi>();

  List<CustomerNotification> notifications = [];
  Future<bool> getCustomerNotifications({bool silently = false}) async {
    if (!silently) {
      if (notifications.isEmpty) setState(ViewState.Busy);
    }
    CustomerNotificationResponse resp;
    try {
      resp = await customerApi.getCustomerNotifications();
      if (resp.data.isEmpty) {
        setState(ViewState.NoDataAvailable);
        notifications = resp.data;
        return false;
      }
      notifications = resp.data;
      setState(ViewState.DataFetched);
      return true;
    } on NetworkException {
      setError("No Internet!");
    } catch (e) {
      setError("An error occured!\n${e.toString()}");
    }
    return false;
  }

}
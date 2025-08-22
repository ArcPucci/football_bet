import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:football_bet/widgets/cards/message_card.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class MailsScreen extends StatelessWidget {
  const MailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (BuildContext context, value, Widget? child) {
        value.updateNotifications();
        return Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 85.h),
                  child: Column(
                    children: [
                      MessagesDivider(text: "new message"),
                      SizedBox(height: 20.h),
                      Column(
                        children: List.generate(value.unseenNotifications.length, (
                          index,
                        ) {
                          final notificationModel = value.unseenNotifications[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: MessageCard(
                              notificationModel: notificationModel,
                            ),
                          );
                        }),
                      ),
                      MessagesDivider(text: "old message"),
                      SizedBox(height: 20.h),
                      Column(
                        children: List.generate(
                          value.notifications.length,
                          (index) {
                            final notificationModel =
                                value.notifications[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: MessageCard(
                                notificationModel: notificationModel,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: CustomAppBar(
                text: "Notification",
                child: SizedBox(
                  width: 218.w,
                  child: Center(
                    child: CustomButton2(
                      text: "Clean all",
                      width: 178.w,
                      height: 47.h,
                      textStyle: AppTextStyles.cn16_400,
                      onTap: value.clearAll,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

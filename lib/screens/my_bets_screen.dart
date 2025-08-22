import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class MyBetsScreen extends StatelessWidget {
  const MyBetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: Consumer<EventsProvider>(
              builder: (context, value, Widget? child) {
                return ListView.separated(
                  padding: EdgeInsets.only(top: 75.h, bottom: 200.h),
                  itemBuilder: (BuildContext context, int index) {
                    final event = value.inactiveEvents[index];
                    return Center(
                      child: InactiveEventCard(
                        event: event,
                        onTap: () => value.reviewEvent(event),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 20.h),
                  itemCount: value.inactiveEvents.length,
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(text: 'My Bets', child: ProfileButtons()),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:football_bet/services/services.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.read<ConfigPreferences>().getShownMessage()) {
        context.read<ConfigPreferences>().setShownMessage();
        showMessage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                HomeBanner(),
                SizedBox(height: 20.r),
                SizedBox(
                  width: 350.w,
                  child: Text("My Events", style: AppTextStyles.cn20_700),
                ),
                Expanded(
                  child: Consumer<EventsProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return ListView.separated(
                        itemCount: value.events.length,
                        padding: EdgeInsets.only(top: 15.h, bottom: 200.h),
                        itemBuilder: (context, index) {
                          final event = value.events[index];
                          return GameCard(
                            eventModel: event,
                            onTap: () => value.selectEvent(event.event),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 20.h);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomAppBar(text: "HOME", child: ProfileButtons()),
        ),
      ],
    );
  }

  void showMessage() {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return MessageDialog();
      },
    );
  }
}

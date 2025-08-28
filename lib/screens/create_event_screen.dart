import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return EventCreateProvider(
          eventsProvider: context.read<EventsProvider>(),
          teamsProvider: context.read<TeamsProvider>(),
          routerProvider: context.read<RouterProvider>(),
          notificationProvider: Provider.of(context, listen: false),
          profileProvider: Provider.of(context, listen: false),
        );
      },
      child: Consumer<EventCreateProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              CustomAppBar(
                text: "Events",
                hasBack: true,
                child: ProfileButtons(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 30.h, bottom: 500.h),
                  child: _buildBody(value),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(EventCreateProvider provider) {
    if (provider.createStatus == EventCreateStatus.addPlayer) {
      return _buildPlayersBody(provider);
    } else if (provider.createStatus == EventCreateStatus.eventDetails) {
      return _buildEventDetails(provider);
    }

    return _buildEventDetails(provider);
  }

  Widget _buildEventDetails(EventCreateProvider value) {
    final firstTeam = value.firstModel == null
        ? 'select a command'
        : value.firstModel!.name;
    final secondTeam = value.secondModel == null
        ? 'select a command'
        : value.secondModel!.name;
    return Column(
      children: [
        SizedBox(
          width: 350.w,
          child: Stack(
            children: [
              Text("${value.sportTitle}\nMATCH", style: AppTextStyles.cns32),
              Positioned(
                left: 145.r,
                bottom: 3.r,
                child: Text("create new", style: AppTextStyles.cns16),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h),
        SizedBox(
          width: 286.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamLogoCard(
                team: value.firstModel,
                onTap: () => value.selectTeam(true),
              ),
              Text("vs", style: AppTextStyles.cns20),
              TeamLogoCard(
                team: value.secondModel,
                onTap: () => value.selectTeam(false),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 330.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110.w,
                child: Center(
                  child: Text(
                    firstTeam,
                    style: AppTextStyles.cns10,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 110.w,
                child: Center(
                  child: Text(
                    secondTeam,
                    style: AppTextStyles.cns10,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        BetsControllers(
          winController: value.winController,
          drawController: value.drawController,
          loseController: value.loseController,
        ),
        SizedBox(height: 30.h),
        SizedBox(
          width: 350.w,
          child: Text("match bet", style: AppTextStyles.cns16),
        ),
        SizedBox(height: 20.h),
        CustomTextField2(
          hintText: 'Please write the desired rate for friends...',
          controller: value.descriptionController,
        ),
        SizedBox(height: 30.h),
        SizedBox(
          width: 350.w,
          child: Text("start of the match", style: AppTextStyles.cns16),
        ),
        SizedBox(height: 20.h),
        CustomDateBox(
          days: value.days,
          hours: value.hours,
          minutes: value.minutes,
          onSave: value.updateDuration,
        ),
        SizedBox(height: 25.h),
        Opacity(
          opacity: value.canStart ? 1 : 0.5,
          child: CustomButton2(
            text: "START Events",
            width: 261.w,
            onTap: value.createEvent,
          ),
        ),
      ],
    );
  }

  Widget _buildPlayersBody(EventCreateProvider value) {
    return Column(
      children: [
        Text("Add player", style: AppTextStyles.cns20),
        SizedBox(height: 20.h),
        Consumer<ProfileProvider>(
          builder: (context, value, Widget? child) {
            return Container(
              width: 355.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppTheme.black,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  AvatarCircle(
                    photo: value.profilePhoto,
                    bgColor: AppTheme.black3,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${value.name} ${value.surname}",
                          style: AppTextStyles.cns14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Opacity(
                    opacity: 0.5,
                    child: Text("owner", style: AppTextStyles.cn10_400),
                  ),
                ],
              ),
            );
          },
        ),
        Column(
          children: List.generate(value.playerModels.length, (index) {
            final model = value.playerModels[index];
            return Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: NewPlayerCard(
                photo: model.photo,
                controller: model.controller,
                maxLength: 12,
                onAddPhoto: () => value.pickImage(index),
                onRemove: () => value.removePlayer(index),
              ),
            );
          }),
        ),
        SizedBox(height: 30.h),
        value.playerModels.isEmpty
            ? CustomButton2(
                text: "ADD PLAYER",
                width: 261.w,
                onTap: value.addPlayer,
              )
            : SizedBox(
                width: 355.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWithText(
                      text: 'ADD PLAYER',
                      width: 175.w,
                      buttonColor: AppTheme.black,
                      onTap: value.addPlayer,
                    ),
                    Opacity(
                      opacity: value.canContinue ? 1 : 0.5,
                      child: ButtonWithText(
                        text: 'CONTINUE',
                        width: 175.w,
                        onTap: value.nextStep,
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

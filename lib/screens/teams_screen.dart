import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../utils/utils.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final newTeamController = TextEditingController();
  String? path;
  final ImagePicker _picker = ImagePicker();
  final list = ["POPULAR", "MY TEAM"];
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamsProvider>(
      builder: (context, value, child) {
        return SafeArea(
          top: false,
          child: Column(
            children: [
              CustomAppBar(
                text: "Events",
                hasBack: true,
                child: ProfileButtons(),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: 350.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(list.length, (index) {
                          final selected = value.selectedTeams == index;
                          return CustomButton2(
                            text: list[index],
                            width: 172.w,
                            height: 48.h,
                            borderRadius: 12,
                            color: selected ? null : AppTheme.black,
                            textStyle: AppTextStyles.cns14.copyWith(
                              color: selected
                                  ? null
                                  : Colors.white.withValues(alpha: 0.5),
                            ),
                            onTap: () => value.changeSwitch(index),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "Select tournaments and teams",
                      style: AppTextStyles.cns14,
                    ),
                    SizedBox(height: 20.h),
                    Expanded(child: _buildBody(value)),
                    CustomButton2(
                      text: 'Select and continue',
                      width: 261.w,
                      onTap: value.selectAndContinue,
                    ),
                    SizedBox(height: 23.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(TeamsProvider value) {
    if (value.selectedTeams == 1) {
      return _buildMyTeams(value);
    }
    return _buildLeagueTeams(value);
  }

  Widget _buildMyTeams(TeamsProvider value) {
    return Column(
      children: [
        NewTeamCard(
          path: path,
          controller: newTeamController,
          rating: _rating,
          onChangedRating: (rating) {
            _rating = rating;
            setState(() {});
          },
          onAddLogo: _pickImage,
        ),
        SizedBox(height: 20.h),
        CustomButton2(
          text: "Create team",
          width: 261.w,
          onTap: () async {
            final name = newTeamController.text;
            if (name.isEmpty || _rating == 0 || path == null) return;
            final success = await value.createTeam(name, path!, _rating);
            if (success) {
              newTeamController.clear();
              _rating = 0;
              path = null;
              setState(() {});
            }
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: List.generate(value.myTeams.length, (index) {
                final model = value.myTeams[index];
                final selected = model.logo == value.selectedTeam?.logo;
                return Padding(
                  padding: EdgeInsets.only(top: index != 0 ? 10.h : 0),
                  child: TeamCard(
                    selected: selected,
                    team: model,
                    onTap: () => value.selectTeam(model),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeagueTeams(TeamsProvider value) {
    return Column(
      children: [
        LeagueWheel(
          initialIndex: value.selectedLeague,
          leagues: value.leagues,
          onChangedLeague: value.onChangedLeague,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: List.generate(value.teams.length, (index) {
                final model = value.teams[index];
                final selected = model.logo == value.selectedTeam?.logo;
                return Padding(
                  padding: EdgeInsets.only(top: index != 0 ? 10.h : 0),
                  child: TeamCard(
                    selected: selected,
                    team: model,
                    onTap: () => value.selectTeam(model),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      path = pickedFile.path;
      setState(() {});
    }
  }
}

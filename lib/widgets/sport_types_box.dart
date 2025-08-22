import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/models/models.dart';
import 'package:football_bet/widgets/widgets.dart';

import '../utils/utils.dart';

class SportTypesBox extends StatelessWidget {
  const SportTypesBox({
    super.key,
    required this.sportModel,
    required this.onChanged,
  });

  final SportModel sportModel;
  final void Function(SportModel) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: ExpandableBox(
        child: Center(
          child: Container(
            width: 289.w,
            height: 193.h,
            decoration: BoxDecoration(
              color: AppTheme.black,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(sportModels.length, (index) {
                final sport = sportModels[index];
                final selected = sportModel.id == sport.id;
                return GestureDetector(
                  onTap: () {
                    if(selected) return;
                    onChanged(sport);
                  },
                  child: Container(
                    width: 266.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: selected ? AppTheme.red : AppTheme.black3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          sport.logo,
                          width: 21.r,
                          height: 21.r,
                          color: selected ? Colors.white : null,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '${sport.name} statistics',
                          style: AppTextStyles.cn12_700,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        triggerBuilder: (context, toggle, toggled) {
          return GestureDetector(
            onTap: toggle,
            child: Container(
              width: 320.w,
              height: 63.h,
              decoration: BoxDecoration(
                color: AppTheme.black3,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Image.asset(
                    sportModel.logo,
                    width: 30.r,
                    height: 30.r,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${sportModel.name} statistics',
                        style: AppTextStyles.cns16,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CustomSwitchBox(toggled: toggled),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

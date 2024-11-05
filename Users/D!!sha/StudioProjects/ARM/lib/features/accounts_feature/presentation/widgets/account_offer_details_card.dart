import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/widgets/account_custom_row.dart';
import '../../data/models/get_regions_month_accounts_model.dart';

class AccountOfferDetailsCard extends StatelessWidget {
  const AccountOfferDetailsCard({super.key, required this.model});
  final GetRegionsMonthAccountsDataModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return accountDetailsCard(
                cost: model.offerStatistics[index].planCost,
                totalCost: model.offerStatistics[index].totalCost,
                name:model.offerStatistics[index] .planName,
                days: model.offerStatistics[index].planDays,
                paidCount: model.offerStatistics[index].paidLicencesCount,
                unPaidCount: model.offerStatistics[index].unpaidLicencesCount,
                totalCount: model.offerStatistics[index].totalLicencesCount,
              );
            },
            itemCount: model.offerStatistics.length,
          ),
          SizedBox(
            height: 20.h,
          ),
          // SizedBox(
          //   child: AccountCustomRow(
          //       text: "مجموع المبلغ الكلى",
          //       value: "7500",
          //       color: ColorManager.amber),
          //   height: 50.h,
          // ),
          // SizedBox(
          //   height: 20.h,
          // ),
        ],
      ),
    );
  }
}

accountDetailsCard({
  required num cost,
  required String name,
  required num paidCount,
  required num unPaidCount,
  required num days,
  required num totalCost,
  required num totalCount,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: customBoxShadow(),
        color: ColorManager.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              AccountCustomRow(
                  text: "عدد الايام", value: days.toString()),
              SizedBox(
                width: 5.w,
              ),
              AccountCustomRow(
                  text: "الاسم", value: name.toString()),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              AccountCustomRow(
                  text: "خ. مدفوعه", value: paidCount.toString()),
              SizedBox(
                width: 5.w,
              ),
              AccountCustomRow(
                  text: "سعر الخطه", value: cost.toString()),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              AccountCustomRow(
                  text: "خطط كليه", value: totalCount.toString()),
              SizedBox(
                width: 5.w,
              ),
              AccountCustomRow(
                  text: "خ.غ مدفوعه", value: unPaidCount.toString()),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            child: AccountCustomRow(
                text: "مجموع المبلغ الكلى للخطه ", value: totalCost.toString(),textWidth: 170.w,),
            height: 50.h,
          )
        ],
      ),
    ),
  );
}


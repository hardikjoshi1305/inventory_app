import 'package:flutter/material.dart';
import 'package:inventory_management/Model/UserlistResponse.dart';

import '../Utility/CommandMethod.dart';
import '../Utility/app_colors.dart';

class UserListWidget extends StatelessWidget {
  final Datum UserModel;

  UserListWidget({this.UserModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        bottomtitle(100.0, this.UserModel.id.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0, this.UserModel.userid),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0, this.UserModel.pass.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            200.0, this.UserModel.mobile != null ? this.UserModel.mobile : "-"),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0,
            this.UserModel.isActive.toString() == 0 ? "InActive" : "Active"),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            130.0,
            this.UserModel.walletAmount != null
                ? this.UserModel.walletAmount + " \u{20B9}"
                : "-"),
        Container(
          width: 1,
          color: Colors.white,
        ),
      ],
    );
    // Card(
    //   elevation: 7,
    //   margin: EdgeInsets.only(top: 16, left: 16, right: 16),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: InkWell(
    //     onTap: () {
    //       // Navigator.of(context).pushNamed(TherapyDetailScreen.routName,
    //       //     arguments: TherapyDetailArguments(
    //       //         categoryTitle: categoryTitle ?? '',
    //       //         therapyTitle: therapyModel.title));
    //     },
    //     child: Column(
    //       children: [
    //         ClipRRect(
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(10),
    //                 topRight: Radius.circular(10)),
    //             // child: CachedNetworkImage(
    //             //   imageUrl: therapyModel.imageUrl,
    //             //   progressIndicatorBuilder: (ctx, url, downloadProgess) {
    //             //     return Center(
    //             //         child: CircularProgressIndicator(
    //             //             color: AppColors.darkYellow));
    //             //   },
    //             //   width: double.infinity,
    //             //   fit: BoxFit.fill,
    //             //   height: 220,
    //             // )),
    //         ),
    //         SizedBox(height: 12),
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(width: 10),
    //             Expanded(
    //                 child: Text(UserModel.name,
    //                     style: TextStyle(
    //                         color: AppColors.darkGray,
    //                         fontWeight: FontWeight.w500))),
    //             SizedBox(width: 16),
    //             Text(
    //                "",
    //               style: TextStyle(
    //                 fontSize: 12,
    //                 color: AppColors.darkGray,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //             SizedBox(width: 10)
    //           ],
    //         ),
    //         SizedBox(height: 6),
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             SizedBox(width: 10),
    //             // Expanded(
    //             //     child: Text(therapyModel.englishName ?? '',
    //             //         style: TextStyle(
    //             //             fontSize: 12, color: AppColors.darkGray))),
    //             // SizedBox(width: 16),
    //             // SvgPicture.asset('assets/icons/ic_circle_arrow_right.svg',
    //             //     width: 20, height: 20),
    //             // SizedBox(width: 10)
    //           ],
    //         ),
    //         SizedBox(height: 12),
    //       ],
    //     ),
    //   ));
  }
}

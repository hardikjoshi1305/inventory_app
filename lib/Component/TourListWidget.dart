import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/Model/TourHistoryResponse.dart';
import 'package:inventory_management/Utility/app_colors.dart';

import '../Utility/CommandMethod.dart';

class TourListWidget extends StatelessWidget {
  final Datum tourhistmodel;

  TourListWidget({this.tourhistmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: bottomtitle2(
                      100,
                      tourhistmodel.tourname == null
                          ? "-"
                          : tourhistmodel.tourname,
                      50.0)),
              Container(
                width: 1,
                color: Colors.white,
              ),
              Expanded(
                  flex: 1,
                  child: bottomtitle2(
                      100,
                      tourhistmodel.createdAt.toString() == null
                          ? "-"
                          : getdateformate(tourhistmodel.createdAt),
                      50.0)),
              Container(
                width: 1,
                color: Colors.white,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: tourhistmodel.iscompleted == 0
                        ? Container(
                            color: AppColors.offWhite,
                            height: 50,
                            padding: EdgeInsets.all(5),
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "Pending",
                              style: TextStyle(color: Colors.red, fontSize: 17),
                            ),
                          )
                        : Container(
                            height: 50,
                            padding: EdgeInsets.all(5),
                            color: AppColors.offWhite,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "Completed",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 17),
                            ),
                          )),
              ),
              Container(
                width: 1,
                color: Colors.white,
              ),
            ],
          ),
          Divider(
            color: Colors.white,
            height: 1,
          )
        ],
      ),
    );

    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: CupertinoColors.systemGrey5,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tourhistmodel.tourname == null ? "-" : tourhistmodel.tourname,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Container(
                  height: 5,
                ),
                // Text(
                //   tourhistmodel.city.toString() == null
                //       ? "-"
                //       : tourhistmodel.city.toString(),
                //   // "13 May,2019 01:30 PM",
                //   style: TextStyle(color: Colors.grey, fontSize: 15),
                // )
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   tourhistmodel.errorname == null
                //       ? "-"
                //       : tourhistmodel.errorname,
                //   style: TextStyle(color: Colors.black, fontSize: 15),
                // ),
                // Container(
                //   height: 5,
                // ),
                Text(
                  tourhistmodel.createdAt.toString() == null
                      ? "-"
                      : getdateformate(tourhistmodel.createdAt),
                  // "13 May,2019 01:30 PM",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: tourhistmodel.iscompleted == 0
                  ? Container(
                      padding: EdgeInsets.all(5),
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.red,
                      child: Text(
                        "Pending",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(5),
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.green,
                      child: Text(
                        "Completed",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    )),
        ],
      ),
    );
  }
}

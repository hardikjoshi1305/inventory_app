import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/Model/ExpenseListDetailsResponse.dart';

import '../Utility/CommandMethod.dart';

class ExpenseListWidget extends StatelessWidget {
  final Datum expenselist;

  ExpenseListWidget({this.expenselist});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  expenselist.expensesName == null
                      ? "-"
                      : expenselist.expensesName,
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
                  expenselist.createdAt.toString() == null
                      ? "-"
                      : getdateformate(expenselist.createdAt),
                  // "13 May,2019 01:30 PM",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: expenselist.amount == null
                  ? Container(
                      padding: EdgeInsets.all(5),
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.red,
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(5),
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.green,
                      child: Text(
                        expenselist.amount,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    )),
        ],
      ),
    );
  }
}

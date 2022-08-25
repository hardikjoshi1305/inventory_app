import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/WalletController.dart';
import 'package:inventory_management/Model/ExpenseListDetailsResponse.dart';
import 'package:inventory_management/Utility/app_colors.dart';

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
      child: Column(
        children: [
          Row(
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
                      expenselist.amount+" \u{20B9}",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  )),
            ],
          ),
        Obx(() => expenselist.isApproved.toString() == "0"?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  acceptrejectorderapi("1",expenselist.id.toString());
                },
                child:  Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.blue,
                  width: 80,
                  height: 40,
                  alignment: AlignmentDirectional.center,
                  child:
                  Container(
                    child: Text("Accept",style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
             ,
              GestureDetector(
                  onTap: (){
                    acceptrejectorderapi("2",expenselist.id.toString());

                  },
                  child:  Container(
                      margin: EdgeInsets.all(10),
                      width: 80,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      color: Colors.red,
                      child:
                      Container(
                        child: Text("Reject",style: TextStyle(color: Colors.white),),
                      ))
              ),

            ],
          ):Container())
        ],
      ),
    );
  }

  void acceptrejectorderapi(String is_approved, String expense_id) async{
    WalletController walletController = Get.find();
  await Future.delayed(Duration.zero);
  walletController.acceptreject(is_approved,expense_id);

  }
}

import 'package:flutter/material.dart';
import 'package:inventory_management/Model/WalletHistoryResponse.dart';

class InventoryHistoryWidget extends StatelessWidget {
  final Datum walletmodel;

  InventoryHistoryWidget({this.walletmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.circle,
              color: Colors.blue,
              size: 28,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  walletmodel.expensesName == null
                      ? "-"
                      : walletmodel.expensesName,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Container(
                  height: 5,
                ),
                Text(
                  walletmodel.createdAt.toString() == null
                      ? "-"
                      : walletmodel.createdAt.toString(),
                  // "13 May,2019 01:30 PM",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: walletmodel.creditAmount == null
                  ? Container(
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.red,
                      child: Text(
                        walletmodel.debitAmount == null
                            ? "-"
                            : walletmodel.debitAmount + " \u{20B9}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  : Container(
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.green,
                      child: Text(
                        walletmodel.creditAmount == null
                            ? "-"
                            : walletmodel.creditAmount + " \u{20B9}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
        ],
      ),
    );
  }
}

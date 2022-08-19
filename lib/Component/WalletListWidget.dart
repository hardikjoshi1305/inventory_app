import 'package:flutter/material.dart';

class WalletListWidget extends StatelessWidget {
  const WalletListWidget({Key key}) : super(key: key);

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
                  "Amount Added",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Container(
                  height: 5,
                ),
                Text(
                  "13 May,2019 01:30 PM",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.green,
              child:  Text(
                "500",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

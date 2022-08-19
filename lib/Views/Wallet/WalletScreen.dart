import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Component/WalletListWidget.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';

import '../../Utility/CommandMethod.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wallet"
        ),
      ),
      drawer:  Drawer(
        elevation: 4.0,
        child: Container(
          color: Colors.blueGrey[600],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              createDrawerHeader(),
              createDrawerBodyItem(
                  icon: Icons.pending_actions,
                  text: 'Pending',
                  onTap: () {
                    Get.to(()=>Dashboard());

                    // Navigator.of(context).pop();
                    // Navigator.pushNamed(context, pageRoutes.landscape);
                  }),
              createDrawerBodyItem(
                  icon: Icons.cloud_done_rounded,
                  text: 'Completed',
                  onTap: () {
                    Navigator.of(context).pop();

                    // _permissionStatus?
                    // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                  }),
              createDrawerBodyItem(
                  icon: Icons.wallet,
                  text: 'Wallet',
                  onTap: () {
                    Get.to(()=>WalletScreen());

                    // _permissionStatus?
                    // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                  }),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'Special Access',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              createDrawerBodyItem(
                  icon: Icons.inventory,
                  text: 'Inventory',
                  onTap: () {
                    Navigator.of(context).pop();

                    // _permissionStatus?
                    // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                  }),

              ListTile(
                title: Text('App version 1.0.0'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child:  Container(
            width: double.infinity,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 120,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.wallet,color: Colors.white,),
                        Container(
                          width: 10,
                          height: 0,
                        ),
                        Text(" Balance :"
                          ,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),),
                        Container(
                          width: 10,
                          height: 0,
                        ),
                        Text("1000 \u{20B9}", style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),

                      ],
                    )
                )
                ,
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(child: Container(

                    child: Column(
                      children: [
                        Divider(
                          color: Colors.black,
                          height: 3,
                        ),
                        Container(
                          height: 10,
                          width: 0,
                        ),
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          child:  Text("    Transcation History",style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Divider(
                            color: Colors.grey,
                            height: 3,
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 16),
                            itemCount: 19,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return WalletListWidget();
                            })
                      ],
                    ),
                  )),
                )
              ],
            )



        ) ,
      )

    );
  }
}

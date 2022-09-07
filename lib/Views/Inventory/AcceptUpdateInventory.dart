import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/AdminReturnInventoryResponse.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Utility/app_colors.dart';

class AcceptUpdateInventory extends StatefulWidget {
  const AcceptUpdateInventory({Key key}) : super(key: key);

  @override
  State<AcceptUpdateInventory> createState() =>
      __AcceptUpdateInventoryStateState();
}

class __AcceptUpdateInventoryStateState extends State<AcceptUpdateInventory> {
  String code,
      name,
      serial_no,
      px_no,
      machine,
      location,
      remark,
      wherefrom,
      status_id;
  var prize, statusdetail, history;
  var id = "0";
  String status_name = "Status";
  Datum usermodel;
  List<String> statuslist = new List();
  List<String> statusIDlist = new List();
  InventoryController inventoryController = Get.put(InventoryController());
  // RxString dropdownvalue = 'Sold Out'.obs;
  // RxString dropdownid = '0'.obs;

  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
  }

  @override
  void initState() {
    // getauthtoken();
    this.status_name == "Status"
        ? ({
            usermodel = Get.arguments as Datum,
            usermodel != null ? id = usermodel.id.toString() : "0",
            // inventoryController.fetchstatuslist("")
          })
        : null;
    te_code..text = this.usermodel != null ? usermodel.code : "";
    te_name..text = this.usermodel != null ? usermodel.name : "";
    te_srno..text = this.usermodel != null ? usermodel.serialNo : "";
    te_pxn..text = this.usermodel != null ? usermodel.pxNo : "";
    te_machine..text = this.usermodel != null ? usermodel.machine : "";
    te_Remark..text = this.usermodel != null ? usermodel.remark : "";
    te_Wherefrom..text = this.usermodel != null ? usermodel.wherefrom : "";
    te_Prize..text = this.usermodel != null ? usermodel.price.toString() : "";
    super.initState();
  }

  TextEditingController te_code = TextEditingController();
  TextEditingController te_name = TextEditingController();
  TextEditingController te_srno = TextEditingController();
  TextEditingController te_pxn = TextEditingController();
  TextEditingController te_machine = TextEditingController();
  TextEditingController te_location = TextEditingController();
  TextEditingController te_Remark = TextEditingController();
  TextEditingController te_Wherefrom = TextEditingController();
  TextEditingController te_Prize = TextEditingController();
  TextEditingController te_statusdetail = TextEditingController();
  TextEditingController te_historydetail = TextEditingController();

  // getstatuslist() {
  //   inventoryController.inventorystatuslist.map((element) {
  //     setState(() {
  //       statuslist.add(element.statusName);
  //       statusIDlist.add(element.id.toString());
  //     });
  //   });
  //   // return statuslist;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Inventory"),
      ),
      body: Obx(() => inventoryController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    height: 20,
                  ),
                  TextField(
                    controller: te_location
                      ..text = this.usermodel != null ? usermodel.location : "",
                    keyboardType: TextInputType.text,
                    onChanged: (value) => location = value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location',
                      prefixIcon: Icon(Icons.location_history),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  TextField(
                    controller: te_statusdetail
                      ..text =
                          this.usermodel != null ? usermodel.statusdetail : "",
                    keyboardType: TextInputType.text,
                    onChanged: (value) => statusdetail = value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Status',
                      prefixIcon: Icon(Icons.chat),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  TextField(
                    controller: te_historydetail,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => history = value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'History',
                      prefixIcon: Icon(Icons.history),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Container(
                        height: 50,
                        width: 300,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('CreateW'),
                          onPressed: () {
                            print('pressed');
                            if (Validateinventory(
                                te_statusdetail.value.text,
                                te_location.value.text,
                                te_historydetail.value.text)) {
                              inventoryController.createinventory(
                                id: id,
                                code: te_code.value.text,
                                name: te_name.value.text,
                                serial_no: te_srno.value.text,
                                px_no: te_pxn.value.text,
                                machine: te_machine.value.text,
                                location: te_location.value.text,
                                remark: te_Remark.value.text,
                                // status_id: dropdownid.value,
                                wherefrom: te_Wherefrom.value.text,
                                Prize: te_Prize.value.text,
                                statusdeatils: te_statusdetail.value.text,
                                history: te_historydetail.value.text,
                              );
                            }

                            // if (validatetourdetail(name, email, password,
                            //     status, city, wallet_amount)) {
                            // userController.createuser(name:name.toString(),email: email.toString(), phone: phone.toString(),password:password.toString(), status:status.toString(),
                            //     city:city.toString(), wallet_amount:wallet_amount.toString(),photo: photo.toString());
                            // }
                          },
                        )),
                  ),
                ],
              ),
            )))),
    );
  }

  bool Validateinventory(
    String statusdetail,
    String history,
    String location,
  ) {
    if (statusdetail.isEmpty || history.isEmpty || location.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the require Details");
      return false;
    } else {
      return true;
    }
  }
}

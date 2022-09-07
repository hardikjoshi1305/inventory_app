import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Utility/app_colors.dart';

class CreateInventory extends StatefulWidget {
  const CreateInventory({Key key}) : super(key: key);

  @override
  State<CreateInventory> createState() => _CreateInventoryState();
}

class _CreateInventoryState extends State<CreateInventory> {
  String code,
      name,
      serial_no,
      px_no,
      machine,
      location,
      remark,
      wherefrom,
      status_id;
  var prize, statusdetail;
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

    // inventoryController.inventorystatuslist == null
    //     ? print("Status Null")
    //     : print("status :" +
    //         inventoryController.inventorystatuslist[0].statusName.toString());

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("postfradd");
    //   inventoryController.inventorystatuslist
    //       .map((element) => items.add(element.statusName));
    //   print(items.toString());
    // });
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
  @override
  void dispose() {
    te_code.dispose();
    te_name.dispose();
    te_srno.dispose();
    te_pxn.dispose();
    te_machine.dispose();
    te_location.dispose();
    te_Remark.dispose();
    te_Wherefrom.dispose();
    te_Prize.dispose();
    te_statusdetail.dispose();
    super.dispose();
  }
  // getstatuslist() {
  //   inventoryController.inventorystatuslist.map((element) {
  //     setState(() {
  //       statuslist.add(element.statusName);
  //       statusIDlist.add(element.id.toString());
  //     });
  //   });
  //   // return statuslist;
  // }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: inventoryController.inventorystatuslist.value.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: ListTile(
                title: Text(
                    inventoryController.inventorystatuslist[index].statusName),
              ),
              onTap: () {
                setState(() {
                  status_name =
                      inventoryController.inventorystatuslist[index].statusName;
                  status_id = inventoryController.inventorystatuslist[index].id
                      .toString();
                });

                Get.back();
                Fluttertoast.showToast(
                    msg: "msg : " +
                        inventoryController
                            .inventorystatuslist[index].statusName);
              });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Inventory"),
        ),
        body: Obx(() => Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Opacity(
                  opacity:
                      1, // You can reduce this when loading to give different effect
                  child: AbsorbPointer(
                    absorbing: inventoryController.isLoading.value,
                    child: screenbody(),
                  ),
                ),
                Opacity(
                  opacity: inventoryController.isLoading.value ? 1.0 : 0,
                  child: CircularProgressIndicator(),
                ),
              ],
            )));
  }

  Widget screenbody() {
    return SingleChildScrollView(
        child: Container(
            child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            height: 20,
          ),
          TextField(
            controller: te_code
              ..text = this.usermodel != null ? usermodel.code : "",
            keyboardType: TextInputType.text,
            onChanged: (value) => code = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Code',
              prefixIcon: Icon(Icons.code),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            child: TextField(
              controller: te_name
                ..text = this.usermodel != null ? usermodel.name : "",
              keyboardType: TextInputType.text,
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.assignment),
                labelText: 'Name',
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(
            controller: te_srno
              ..text = this.usermodel != null ? usermodel.serialNo : "",
            keyboardType: TextInputType.text,
            onChanged: (value) => serial_no = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Serial Number',
              prefixIcon: Icon(Icons.numbers),
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(
            controller: te_pxn
              ..text = this.usermodel != null ? usermodel.pxNo : "",
            keyboardType: TextInputType.text,
            onChanged: (value) => px_no = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Px Number',
              prefixIcon: Icon(Icons.point_of_sale),
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(
            controller: te_machine
              ..text = this.usermodel != null ? usermodel.machine : "",
            keyboardType: TextInputType.text,
            onChanged: (value) => machine = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Machine',
              prefixIcon: Icon(Icons.production_quantity_limits),
            ),
          ),
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
            controller: te_Remark
              ..text = this.usermodel != null ? usermodel.remark : "",
            keyboardType: TextInputType.text,
            onChanged: (value) => remark = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Remark',
              prefixIcon: Icon(Icons.message),
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(
            controller: te_Wherefrom
              ..text = this.usermodel != null ? usermodel.wherefrom : "",
            keyboardType: TextInputType.text,
            onChanged: (value) => wherefrom = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Wherefrom',
              prefixIcon: Icon(Icons.location_city),
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(
            controller: te_statusdetail
              ..text = this.usermodel != null ? usermodel.statusdeatils : "",
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
            controller: te_Prize
              ..text = this.usermodel != null ? usermodel.price.toString() : "",
            keyboardType: TextInputType.number,
            onChanged: (value) => prize = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Price',
              prefixIcon: Icon(Icons.money),
            ),
          ),
          Container(
            height: 20,
          ),
          // DecoratedBox(
          //     decoration: BoxDecoration(
          //         color: AppColors.offWhite,
          //         border: Border.all(color: Colors.black38, width: 1),
          //         borderRadius: BorderRadius.circular(
          //             10), //border raiuds of dropdown button
          //         boxShadow: <BoxShadow>[
          //           //apply shadow on Dropdown button
          //           // /blur radius of shadow
          //         ]),
          //     child:
          //         // ElevatedButton(
          //         //   child: status_name == "Status"
          //         //       ? Text("Status")
          //         //       : Text(status_name),
          //         //   onPressed: (() => showDialog(
          //         //       context: context,
          //         //       builder: (BuildContext context) {
          //         //         return AlertDialog(
          //         //           title: Text("Status"),
          //         //           content: setupAlertDialoadContainer(),
          //         //         );
          //         //       })),
          //         // )
          //
          //         // Padding(
          //         //     padding: const EdgeInsets.only(left: 60.0, right: 60.0),
          //         //     child: Obx(
          //         //       () => dropdownvalue.value == "Sold Out"
          //         //           ? DropdownButton(
          //         //               elevation: 0,
          //         //               value: dropdownvalue.value,
          //         //               hint: Text("Status"),
          //         //               icon: Icon(Icons.keyboard_arrow_down),
          //         //               items: inventoryController.inventorystatuslist
          //         //                   .map((items) {
          //         //                 return DropdownMenuItem(
          //         //                     onTap: () {
          //         //                       dropdownid.value =
          //         //                           items.id.toString();
          //         //                       print("objectkey" + dropdownid.value);
          //         //                     },
          //         //                     value: items.statusName,
          //         //                     child: Text(items.statusName));
          //         //               }).toList(),
          //         //               onChanged: (newValue) {
          //         //                 dropdownvalue.value = newValue;
          //         //               },
          //         //             )
          //         //           : DropdownButton(
          //         //               elevation: 0,
          //         //               value: dropdownvalue.value,
          //         //               hint: Text("Status"),
          //         //               icon: Icon(Icons.keyboard_arrow_down),
          //         //               items: inventoryController.inventorystatuslist
          //         //                   .map((items) {
          //         //                 return DropdownMenuItem(
          //         //                     onTap: () {
          //         //                       dropdownid.value =
          //         //                           items.id.toString();
          //         //                       print("objectkey" + dropdownid.value);
          //         //                     },
          //         //                     value: items.statusName,
          //         //                     child: Text(items.statusName));
          //         //               }).toList(),
          //         //               onChanged: (newValue) {
          //         //                 dropdownvalue.value = newValue;
          //         //               },
          //         //             ),
          //         //     ))
          //     //   // DropdownButton<String>(
          //     //   //   items:
          //     //   //       userController.inventorystatuslist.map((element) {
          //     //   //     print("object" + element.statusName);
          //     //   //     return DropdownMenuItem<String>(
          //     //   //       child: Text(element.statusName),
          //     //   //     );
          //     //   //   }).toList(),
          //     //   // onChanged: ((value) => setState(() {
          //     //   //       status_id = value;
          //     //   //     })),
          //     //   // value: status_id,
          //     //   // ),
          //     // ),
          //     ),

          // TextField(
          //   keyboardType: TextInputType.number,
          //   onChanged: (value) => status_id = value,
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: 'Status',
          //     prefixIcon: Icon(Icons.location_history),
          //   ),
          // ),
          Container(
            height: 20,
          ),

          // TextField(
          //   keyboardType: TextInputType.text,
          //   onChanged: (value) => photo = value,
          //   onTap:
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: 'Photo',
          //     prefixIcon: Icon(Icons.image),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
                height: 50,
                width: 300,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    print('pressed');
                    if (Validateinventory(
                        te_code.value.text,
                        te_name.value.text,
                        te_srno.value.text,
                        te_pxn.value.text,
                        te_machine.value.text,
                        te_location.value.text,
                        te_Remark.value.text)) {
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
                        Prize: te_Prize.value.text.toString(),
                        statusdeatils: te_statusdetail.value.text,
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
    )));
  }

  bool Validateinventory(String code, String name, String serial_no,
      String px_no, String machine, String location, String remark) {
    print("sr.no" + serial_no);
    print("code" + code);
    if (code.isEmpty ||
        name.isEmpty ||
        serial_no.isEmpty ||
        px_no.isEmpty ||
        machine.isEmpty ||
        location.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the require Details");
      return false;
    } else {
      return true;
    }
  }
}

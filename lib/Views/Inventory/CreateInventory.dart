import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:mime/mime.dart';

class CreateInventory extends StatefulWidget {
  const CreateInventory({Key key}) : super(key: key);

  @override
  State<CreateInventory> createState() => _CreateInventoryState();
}

class _CreateInventoryState extends State<CreateInventory> {
  String code,
      id,
      name,
      serial_no,
      px_no,
      machine,
      location,
      remark,
      status_id = " ";
  List<String> statuslist = new List();
  List<String> statusIDlist = new List();
  InventoryController inventoryController = Get.put(InventoryController());
  Datum usermodel = Get.arguments as Datum;
  String dropdownvalue = 'Status';

  var items = [
    'Status',
  ];
  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
  }

  @override
  void initState() {
    // getauthtoken();
    inventoryController.fetchstatuslist("");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("postfradd");
      inventoryController.inventorystatuslist
          .map((element) => items.add(element.statusName));
      print(items.toString());
    });
    super.initState();
  }

  TextEditingController te_code = TextEditingController();
  TextEditingController te_name = TextEditingController();
  TextEditingController te_srno = TextEditingController();
  TextEditingController te_pxn = TextEditingController();
  TextEditingController te_machine = TextEditingController();
  TextEditingController te_location = TextEditingController();
  TextEditingController te_Remark = TextEditingController();

  // getstatuslist() {
  //   userController.inventorystatuslist.map((element) {
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
        itemCount: inventoryController.inventorystatuslist.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title:
                Text(inventoryController.inventorystatuslist[index].statusName),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.usermodel != null ? id = this.usermodel.id.toString() : "0";
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Inventory"),
      ),
      body: SingleChildScrollView(
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.visiblePassword,
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
              keyboardType: TextInputType.visiblePassword,
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
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
            DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(
                        10), //border raiuds of dropdown button
                    boxShadow: <BoxShadow>[
                      //apply shadow on Dropdown button
                      // /blur radius of shadow
                    ]),
                child: ElevatedButton(
                  child: Text("Status"),
                  onPressed: (() => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Status'),
                          content: setupAlertDialoadContainer(),
                        );
                      })),
                )

                // Padding(
                //   padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                //   child: DropdownButton(
                //     elevation: 0,
                //     value: dropdownvalue,
                //     icon: Icon(Icons.keyboard_arrow_down),
                //     items: items.map((String items) {
                //       return DropdownMenuItem(value: items, child: Text(items));
                //     }).toList(),
                //     onChanged: (String newValue) {
                //       setState(() {
                //         dropdownvalue = newValue;
                //       });
                //     },
                //   ),
                //   // DropdownButton<String>(
                //   //   items:
                //   //       userController.inventorystatuslist.map((element) {
                //   //     print("object" + element.statusName);
                //   //     return DropdownMenuItem<String>(
                //   //       child: Text(element.statusName),
                //   //     );
                //   //   }).toList(),
                //   // onChanged: ((value) => setState(() {
                //   //       status_id = value;
                //   //     })),
                //   // value: status_id,
                //   // ),
                // ),
                ),

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
                      if (Validateinventory(code, name, serial_no, px_no,
                          machine, location, remark)) {
                        inventoryController.createinventory(
                            id: id,
                            code: code,
                            name: name,
                            serial_no: serial_no,
                            px_no: px_no,
                            machine: machine,
                            location: location,
                            remark: remark);
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
      ))),
    );
  }

  bool Validateinventory(
      code, name, serial_no, px_no, machine, location, remark) {
    if (code.toString().isEmpty ||
        name.toString().isEmpty ||
        px_no.toString().isEmpty ||
        machine.toString().isEmpty ||
        location.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the require Details");
      return false;
    } else {
      return true;
    }
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:mime/mime.dart';

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
      status_id = " ";
  List<String> statuslist = new List();
  List<String> statusIDlist = new List();
  InventoryController userController = Get.put(InventoryController());
  Datum usermodel = Get.arguments as Datum ;

  @override
  void initState() {
    userController.fetchstatuslist();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
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

  @override
  Widget build(BuildContext context) {
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
                    controller:te_code..text= this.usermodel!=null?usermodel.code:"",
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
                     controller:te_name..text= this.usermodel!=null?usermodel.name:"",
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
                controller:te_srno..text= this.usermodel!=null?usermodel.serialNo:"",
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
                    controller:te_pxn..text= this.usermodel!=null?usermodel.pxNo:"",
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
                  controller:te_machine..text= this.usermodel!=null?usermodel.machine:"",
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
                    controller:te_location..text= this.usermodel!=null?usermodel.location:"",
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
                    controller:te_Remark..text= this.usermodel!=null?usermodel.remark:"",
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                      child: DropdownButton<String>(
                        hint: Text("ddd"),
                        items:
                            userController.inventorystatuslist.map((element) {
                          print("object" + element.statusName);
                          return DropdownMenuItem<String>(
                            child: Text("element.statusName"),
                          );
                        }).toList(),
                        // onChanged: ((value) => setState(() {
                        //       status_id = value;
                        //     })),
                        // value: status_id,
                      ),
                    ),
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
                            if(Validateinventory(code,name,serial_no,px_no,machine,location,remark)){
                              userController.createinventory(code:code,name: name,serial_no: serial_no,px_no: px_no,machine: machine,location: location,remark: remark);

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
            ),
          ),
        ));
  }

  bool Validateinventory(code, name, serial_no, px_no, machine, location,remark) {
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

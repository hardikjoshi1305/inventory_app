import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';

class SendInventory extends StatefulWidget {
  const SendInventory({Key key}) : super(key: key);

  @override
  State<SendInventory> createState() => _SendInventoryState();
}
var userid;

class _SendInventoryState extends State<SendInventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Inventory"),
      ),
      drawer: AdminDrawer(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              Container(
                child: TextField(
                  // controller: te_name
                  //   ..text = this.usermodel != null ? usermodel.name : "",
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    userid = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'User ID',
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              // DropdownSearch<String>(
              //   mode: Mode.MENU,
              //   showSearchBox: true,
              //   isFilteredOnline: true,
              //   dropDownButton: const Icon(
              //     Icons.keyboard_arrow_down,
              //     color: Colors.grey,
              //     size: 18,
              //   ),
              //   dropdownSearchDecoration: Styles.inputDecoration(
              //     w: w,
              //     hintText: 'Search Programs',
              //     icon: CupertinoIcons.doc_text_fill,
              //     white: true,
              //   ),
              //   dropdownBuilder: _customDropDownPrograms,
              //   popupItemBuilder: _customPopupItemBuilder,
              //   onChanged: (Class object) {
              //     setState(() {
              //       if (object != null) {
              //
              //       }
              //     });
              //   },
              //   onFind: (String filter) =>
              //       getData(filter ?? "", storeId: storeId),
              //   showClearButton: false,
              //   clearButtonBuilder: (_) => const Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Icon(Icons.clear, size: 17, color: Colors.black),
              //   ),
              // )
              Container(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ),
              ),

            ],
          ),
        ),
      ) ,
    );
  }

//   static Future<List<BootcampDetails>> getData(String filter,
//       {String storeId = ""}) async {
//     var response = await http.post(
//         Uri.parse("https://dummyURl.com"),
//         body: jsonEncode(<String, dynamic>{
//         "pageSize": 100,
//         "pageNumber": 1,
//         "keywords": "",
//         "filters": {
//         "searchText": filter
//         }),
//         );
//
//         if (response.statusCode == 200) {
//         List bootcampsJson = jsonDecode(response.body)['result'];
//         var detailsList = <BootcampDetails>[];
//         for (Map<String, dynamic> bootcamp in bootcampsJson) {
//         detailsList.add();
//         }
//         returnd detailsList.toList();
//         } else {
//         throw Exception("Error ${response.statusCode}");
//         }
//         }
//   Widget _customPopupItemBuilder(
//       BuildContext context, dynamic item, bool isSelected) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: !isSelected
//           ? null
//           : BoxDecoration(
//         border: Border.all(color: Theme.of(context).primaryColor),
//         borderRadius: BorderRadius.circular(5),
//         color: Colors.white,
//       ),
//       child: ListTile(
//         title: Text(item.toString(),
//             style: const TextStyle(
//               fontSize: 14,
//               color: Color.fromARGB(255, 102, 100, 100),
//             )),
//       ),
//     );
//   }
//   Widget _customDropDownPrograms(BuildContext context, BootcampDetails item) {
//     return Container(
//         child: (item == null)
//             ? const ListTile(
//           contentPadding: EdgeInsets.all(0),
//           title: Text("Search Programs",
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                   fontSize: 13,
//                   color: Color.fromARGB(235, 158, 158, 158))),
//         )
//             : ListTile(
//             contentPadding: const EdgeInsets.all(0),
//             title: Text(
//               item.title,
//               textAlign: TextAlign.left,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(fontSize: 13.5, color: Colors.black),
//             )));
//   }
 }

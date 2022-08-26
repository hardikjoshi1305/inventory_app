import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/TourController.dart';

class Createtrip extends StatefulWidget {
  const Createtrip({Key key}) : super(key: key);

  @override
  State<Createtrip> createState() => _CreatetripState();
}

class _CreatetripState extends State<Createtrip> {
  var city, problem;
  String tourname = "";
  @override
  void initState() {
    super.initState();
  }

  TourController tourController = Get.put(TourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Trip"),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Opacity(
              opacity:
                  1, // You can reduce this when loading to give different effect
              child: AbsorbPointer(
                absorbing: tourController.isLoading.value,
                child: screenbody(),
              ),
            ),
            Opacity(
              opacity: tourController.isLoading.value ? 1.0 : 0,
              child: CircularProgressIndicator(),
            ),
          ],
        ));
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
                keyboardType: TextInputType.text,
                onChanged: (value) => tourname = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tour Name',
                  prefixIcon: Icon(Icons.tour),
                ),
              ),
              Container(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) => problem = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Problem',
                  prefixIcon: Icon(Icons.report_problem),
                ),
              ),
              Container(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) => city = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                  prefixIcon: Icon(Icons.location_city),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                    height: 50,
                    width: 300,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Create'),
                      onPressed: () {
                        print('data:$tourname');
                        print('data:$city');
                        print('data:$problem');
                        if (validatetourdetail(tourname, city, problem)) {
                          tourController.creattour(
                              tourname: tourname, problem: problem, city: city);
                        }
                        //   logincontroller.fetchLogin(number:phoneController.value.text,password:passwordController.value.text);
                        //   // loginuser(phoneController.value.text, passwordController.value.text, context);
                        // }
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validatetourdetail(String tourname, String city, String problem) {
    if (tourname.isEmpty || city.isEmpty || problem.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Fill all the details", toastLength: Toast.LENGTH_LONG);
      return false;
    } else {
      return true;
    }
  }
}

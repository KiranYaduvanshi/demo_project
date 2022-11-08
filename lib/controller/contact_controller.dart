import 'dart:convert';

import 'package:demo_flutter_project/model.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController {
  RxList contactList = [].obs;
  List<Contact> fContacts = [];
  RxList dataList = [].obs;
  Rx<GetApiResponse> getdata = GetApiResponse().obs;

  Future<void> getContactList() async {
    if(await FlutterContacts.requestPermission()) {
      fContacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);

      print("number ---- ${fContacts[0].displayName}");
      print("number ---- ${fContacts.length}");
      print("number ---- ${fContacts[0].phones[0].number}");
    }
    update();
  }

  @override
  void onInit() {

    getContactList();
 //   addData();

    //getList();
    super.onInit();
  }

  Future<void> addData()async{
    var box = await Hive.openBox('myBox');
    await box.put('name', 'world');
    print("data added successfully");
  }

  Future<void> readData() async{
    var box =  await Hive.openBox('myBox');
    Iterable name = box.values;
    print("name ====== $name");



  }


  // get single data
  Future<void> getData() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));

    print("response ---- ${response.body}");
    if (response.statusCode == 200) {
      getdata.value = GetApiResponse.fromJson(jsonDecode(response.body));
      print(
          "data ----- ${getdata.value.title} --- \n -- ${getdata.value.userId}");
    } else {
      print("error ---  ${response.body}");
    }
  }

  // get list
  Future<void> getList() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    dataList.value = (json.decode(response.body) as List)
        .map((e) => GetApiResponse.fromJson(e))
        .toList();

    for (int i = 0; i < dataList.length; i++) {
      print("list data ---- ${dataList.value[i]}");
    }
  }
}

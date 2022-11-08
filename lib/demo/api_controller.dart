import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'get_data_model.dart';
import 'post_data_model.dart';


class ApiController extends GetxController{

//  GetDataModel getdata = GetDataModel();
 // final getdata = Rxn<GetDataModel>().obs;
  final Rx<GetDataModel> getdata = GetDataModel().obs;
  PageController pageController = PageController();
  RxDouble currentPage = 0.0.obs;


  //RxList dataList =[].obs;

  RxList  dataList =[].obs;


  /**  convert  list of json objects  into the class object  **/
  // Future<void> getData() async{
  //
  //   final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  //   print("data ------ ${response}");
  //
  //   String responseBody = response.body;
  //   var jsonBody = json.decode(responseBody);
  //
  //   for(var data in jsonBody){
  //     dataList.add(DataModel(data['userId'],data["id"],data["title"],data["completed"]));
  //     dataList.forEach((element) {
  //     //  print("title ------>>>> ${element.title}");
  //       print("userId ------>>>> ${element.userId}");
  //     });
  //   }
  //
  // }

  /**  convert  list of json objects  into the class object  **/
  Future<void> getData() async{

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    print("get data  ------ ${response}");

    //dataList.value = GetDataModel.fromJson(jsonDecode(response.body)) as List ;
    // dataList.add(getdata.value.id,);
    // for(int i = 0 ; i <dataList.length ; i++){
    //   print("title ------>>>> ${dataList[i]}");
    //
    // }


    var jsonToMap= jsonDecode(response.body) as List;
    jsonToMap.map((e) => GetDataModel.fromJson(e)).toList();


     dataList.value = (json.decode(response.body) as List)
        .map((data) => GetDataModel.fromJson(data))
        .toList();
     dataList.forEach((element) { });

  }

  /** get single data **/
  Future<void> getSingleData()  async{

    //Get Json
    var response =  await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));

    //Convert Json to map
    Map<String,dynamic> jsonToMap = jsonDecode(response.body);

    //Convert Map to Class Object
    GetDataModel classObject =  GetDataModel.fromJson(jsonToMap);

    if(response.statusCode == 200) {
      getdata.value = GetDataModel.fromJson(jsonDecode(response.body));
      print("data ------ ${getdata.value.title}");
    }
    else{
      print("ERROR ${response.statusCode}");
    }
  }


  /** post api data **/
  Future<void> postData() async{
    PostDataModel postDataModel = PostDataModel(title: "bhhjjh",body: "jhjjkk",userId: 2);

    var classToMap = postDataModel.toJson();
    var mapToJson = jsonEncode(classToMap);

    http.Response response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: mapToJson
    );

    print('post data resposne ---- ${response.body}');
    var jsonToMap = jsonDecode(response.body);
    getdata.value= GetDataModel.fromJson(jsonToMap);
    print('getting data ------  ${getdata.value}');

  }


  /**  post list data **/
  Future<void> postListData() async{
    // PostDataModel postDataModel = PostDataModel(title: "bhhjjh",body: "jhjjkk",userId: 2);
    // PostDataModel postDataModel1 = PostDataModel(title: "bhhjjh",body: "jhjjkk",userId: 3);
    // PostDataModel postDataModel2 = PostDataModel(title: "bhhjjh",body: "jhjjkk",userId: 4);

    // Step 1 = List of class object
    List<PostDataModel> listTodos = [];
    listTodos.add(PostDataModel(title: "bhhjjh",body: "jhjjkk",userId: 2));
    listTodos.add(PostDataModel(title: "bhhjjh",body: "jhjjkk",userId: 3));
    listTodos.add(PostDataModel(title: "bhhjjh",body: "jhjjkk",userId: 4));

    //Step 2 = list of Map
    List<Map<String,dynamic>> list = listTodos.map((e) => e.toJson()).toList();

    //sStep 3 =
    var jsonList = jsonEncode(list)  ;

    print("json list ---- ${jsonList}");
    http.Response response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body:jsonList
    );

    print('post data resposne ---- ${response.body}');
    var jsonToMap = jsonDecode(response.body);
    getdata.value= GetDataModel.fromJson(jsonToMap);
    print('getting data ------  ${getdata.value.id}');
  }

  @override
  void onInit() {
    print("Kiran ------");
    // getData();
    // getSingleData();
   postData();
    // postListData();

    pageController.addListener((){
        currentPage.value = pageController.page!;
    });

    super.onInit();
  }



}
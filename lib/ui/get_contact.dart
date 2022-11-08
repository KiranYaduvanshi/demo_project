import 'dart:math';

import 'package:demo_flutter_project/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class GetContact extends GetView<ContactController> {
   //ContactController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              controller.addData();

            }, child: "click".text.make()),
            GetBuilder<ContactController>(
              init: controller,
              builder: (ctr) {
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: ctr.fContacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GetBuilder(
                           builder: (GetxController controller) {
                        return contactList(contact:  ctr.fContacts[index], index: index);
                      },);
                    });
              }
            ).expand(),
          ],
        ),
      ),
    );
  }

  Widget contactList({required Contact contact,required int index}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),

              child: Center(child: "${contact.displayName.substring(0,1).toUpperCase()} ".text.black.bold.make())),
          ...contact.phones.map((e) => "${e.number}".text.make()).toList(),
        ],
      ).p(20),
    );
  }

}

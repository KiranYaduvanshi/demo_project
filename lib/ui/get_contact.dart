import 'package:demo_flutter_project/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class GetContact extends StatelessWidget {
  ContactController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ContactController>(
        init: controller,
        builder: (ctr) {
          return ListView.builder(
              itemCount: ctr.fContacts.length,
              itemBuilder: (BuildContext context, int index) {
                return contactList(contact:  ctr.fContacts[index], index: index);
              });
        }
      ),
    );
  }

  Widget contactList({required Contact contact,required int index}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "${contact.displayName} ".text.make(),
          ...contact.phones.map((e) => "${e.number}".text.make()).toList(),
        ],
      ).p(20),
    );
  }
}

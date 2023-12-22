import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/model/contact_cont.dart';
import 'package:platform_convertor/model/contact_model.dart';
import 'package:platform_convertor/model/current_step.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contactList = [
    Contact(
      name: 'Harsh',
      contact: '81288 95379',
      email: 'harsh@gmail.com',
      assetPic: 'assets_img/img1.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Mohit',
      contact: '15428 95684',
      email: 'mohit@gmail.com',
      assetPic: 'assets_img/img2.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Rahil',
      contact: '71428 95684',
      email: 'rahil@gmail.com',
      assetPic: 'assets_img/img3.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Manav',
      contact: '15428 95684',
      email: 'manav@gmail.com',
      assetPic: 'assets_img/img4.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Pranav',
      contact: '15428 95684',
      email: 'pranav@gmail.com',
      assetPic: 'assets_img/img5.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Vraj sir',
      contact: '15428 95684',
      email: 'vrajsir@gmail.com',
      assetPic: 'assets_img/img6.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Raj',
      contact: '15428 95684',
      email: 'raj@gmail.com',
      assetPic: 'assets_img/img7.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Deep',
      contact: '15428 95684',
      email: 'deep@gmail.com',
      assetPic: 'assets_img/img8.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Neel',
      contact: '15428 95684',
      email: 'neel@gmail.com',
      assetPic: 'assets_img/img9.jpeg',
      time: 'Yesterday,9:40 PM',
    ),
  ];
  // List<CallsData> callList = [
  //   CallsData(
  //     name: 'Tony Stack',
  //     contact: '98765 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/tony.jpg',
  //   ),
  //   CallsData(
  //     name: 'Ben 10',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/ben.jpg',
  //   ),
  //   CallsData(
  //     name: 'Gwen 10',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/gwen10.jpg',
  //   ),
  //   CallsData(
  //     name: 'Doremon',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/doremon.jpg',
  //   ),
  //   CallsData(
  //     name: 'Nobita',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/nobi.jpg',
  //   ),
  //   CallsData(
  //     name: 'Hathori',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/hathori.jpg',
  //   ),
  //   CallsData(
  //     name: 'Oggy',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/oggy.jpg',
  //   ),
  //   CallsData(
  //     name: 'Spider Man',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/spider.jpg',
  //   ),
  //   CallsData(
  //     name: 'Thor',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/thor.jpg',
  //   ),
  // ];

  // Add Data Provider ....
  CurrentStep cs = CurrentStep(currentStep: 0);

  // TextEditing Controller Obj.................
  ControllerVar convar = ControllerVar(
      nameC: TextEditingController(text: ''),
      emailC: TextEditingController(text: ''),
      contactC: TextEditingController(text: ''));

  // Add Contact Data..........
  void addContact(String name, String contact, String email) {
    Contact data = Contact(
      name: name,
      contact: contact,
      email: email,
      pic: pickImage!,
      time: 'Just Now',
    );
    contactList.add(data);
    notifyListeners();
  }

  void addData(String name, String contact, String email) {
    Contact data = Contact(
      pic: pickImage!,
      name: name,
      contact: contact,
      email: email,
      time: 'Just Now',
    );
    contactList.add(data);
    notifyListeners();
  }

  // Gallery Pic :-------
  String? pickImage;
  imagePic() async {
    final ImagePicker picker = ImagePicker();

    XFile? res = await picker.pickImage(source: ImageSource.gallery);
    String path = res!.path;
    pickImage = path;
    notifyListeners();
  }

  // Check Fill Data Or Not ...................
  checkFillData() {
    if (convar.nameC.text.isNotEmpty &&
        convar.emailC.text.isNotEmpty &&
        convar.contactC.text.isNotEmpty) {
      addData(
        convar.nameC.text,
        convar.contactC.text,
        convar.emailC.text,
      );
      convar.contactC.clear();
      convar.nameC.clear();
      convar.emailC.clear();
    } else if (convar.nameC.text.isNotEmpty &&
        convar.emailC.text.isNotEmpty &&
        convar.contactC.text.isNotEmpty) {
      addContact(convar.nameC.text, convar.contactC.text, convar.emailC.text);

      convar.contactC.clear();
      convar.nameC.clear();
      convar.emailC.clear();
    }
    notifyListeners();
  }

  checkContinueState() {
    if (cs.currentStep < 3) {
      cs.currentStep++;
    }
    notifyListeners();
  }

  checkCancelState() {
    if (cs.currentStep > 0) {
      cs.currentStep--;
    }
    notifyListeners();
  }
}

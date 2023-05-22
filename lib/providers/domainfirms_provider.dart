import 'package:flutter/material.dart';
import 'package:risetimedev2023/models/domain_firms.dart';
import 'package:risetimedev2023/services/domainfirms/firestore_domainfirms_service.dart';
import 'package:uuid/uuid.dart';


class DomainFirmsProvider with ChangeNotifier {

  final firestoreService = FirestoreDomainFirmsService();
  String? _id;
  String? _name;
  String? _loginname;
  String? _loginpassword;
  String? _web;

  var uuid = Uuid();

  String? get id => _id;

  String? get name => _name;

  String? get loginname => _loginname;

  String? get loginpassword => _loginpassword;

  String? get web => _web;

  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeLoginName(String value) {
    _loginname = value;
    notifyListeners();
  }

  changeLoginPassword(String value) {
    _loginpassword = value;
    notifyListeners();
  }

  changeWeb(String value) {
    _web = value;
    notifyListeners();
  }

  loadValues(DomainFirms domainfirm) {
    _id = domainfirm.id;
    _name = domainfirm.name;
    _loginname = domainfirm.loginname;
    _loginpassword = domainfirm.loginpassword;
    _web = domainfirm.web;
  }

  saveDomainFirm() {
    if (_id == null) {
      var newDomainFirm = DomainFirms(
          id: uuid.v4(),
          name: name,
          loginname: loginname,
          loginpassword: loginpassword,
          web: web);
      firestoreService.saveDomainFirm(newDomainFirm);
    } else {
      //Update
      var updatedDomainFirm = DomainFirms(
          id:id,
          name: name,
          loginname: loginname,
          loginpassword: loginpassword,
          web: web);
      firestoreService.saveDomainFirm(updatedDomainFirm);
    }
  }

  removeDomainFirm(String id) {
    firestoreService.removeDomainFirm(id);
  }
}

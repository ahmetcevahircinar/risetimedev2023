import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:risetimedev2023/models/domain_firms.dart';
import 'package:risetimedev2023/providers/domainfirms_provider.dart';

import '../services/domainfirms/firestore_domainfirms_service.dart';

class EditDomainFirmsView extends StatefulWidget {
  final DomainFirms? domainfirm;

  EditDomainFirmsView([this.domainfirm]);

  @override
  _EditDomainFirmsViewState createState() => _EditDomainFirmsViewState();
}

class _EditDomainFirmsViewState extends State<EditDomainFirmsView> {
  final nameController = TextEditingController();
  final loginnameController = TextEditingController();
  final loginpasswordController = TextEditingController();
  final webController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    loginnameController.dispose();
    loginpasswordController.dispose();
    webController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.domainfirm == null) {
      //New Record
      nameController.text = "";
      loginnameController.text = "";
      loginpasswordController.text = "";
      webController.text = "";
      new Future.delayed(Duration.zero, () {
        final domainfirmsProvider =
            Provider.of<DomainFirmsProvider>(context, listen: false);
        domainfirmsProvider.loadValues(DomainFirms());
      });
    } else {
      //Controller Update
      nameController.text = widget.domainfirm!.name!;
      loginnameController.text = widget.domainfirm!.loginname!;
      loginpasswordController.text = widget.domainfirm!.loginpassword!;
      webController.text = widget.domainfirm!.web!;
      //State Update
      new Future.delayed(Duration.zero, () {
        final domainfirmsProvider =
            Provider.of<DomainFirmsProvider>(context, listen: false);
        domainfirmsProvider.loadValues(widget.domainfirm!);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final domainfirmsProvider = Provider.of<DomainFirmsProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: (widget.domainfirm != null)
              ? Text('Edit Domain Firm')
              : Text('Add Domain Firm')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Domain Firm Name'),
              onChanged: (value) {
                domainfirmsProvider.changeName(value);
              },
            ),
            TextField(
              controller: loginnameController,
              decoration: InputDecoration(hintText: 'Domain Firm Login Name'),
              onChanged: (value) {
                domainfirmsProvider.changeLoginName(value);
              },
            ),
            TextField(
              controller: loginpasswordController,
              decoration:
                  InputDecoration(hintText: 'Domain Firm Login Password'),
              onChanged: (value) {
                domainfirmsProvider.changeLoginPassword(value);
              },
            ),
            TextField(
              controller: webController,
              decoration: InputDecoration(hintText: 'Domain Firm Web'),
              onChanged: (value) {
                domainfirmsProvider.changeWeb(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                domainfirmsProvider.saveDomainFirm();
                Navigator.of(context).pop();
              },
            ),
            (widget.domainfirm != null)
                ? ElevatedButton(
                    child: Text('Delete'),
                    onPressed: () {
                      domainfirmsProvider.removeDomainFirm(widget.domainfirm!.id!);
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

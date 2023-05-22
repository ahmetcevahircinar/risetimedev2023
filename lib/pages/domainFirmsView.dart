import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:risetimedev2023/models/domain_firms.dart';
import 'package:risetimedev2023/models/side_drawer.dart';
import 'editDomainFirmsView.dart';

class DomainFirmsView extends StatelessWidget {
  String name = "";
  String loginname = "";
  String loginpassword = "";
  String web = "";

  @override
  Widget build(BuildContext context) {
    final domainfirms = context.watch<List<DomainFirms>>();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Domain Firms'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditDomainFirmsView()));
            },
          )
        ],
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                size: 40,
                color: Colors.black,
              ),
              color: Colors.black,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ),
      drawer: CustomSideDrawer(),
      body: ListView.builder(
          itemCount: domainfirms.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              ),
              title: Text(domainfirms[index].name!),
              subtitle: Text(domainfirms[index].loginname!),
              trailing: Text(domainfirms[index].web!),
              isThreeLine: true,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        EditDomainFirmsView(domainfirms[index])));
              },
            );
          }),
    );
  }
}

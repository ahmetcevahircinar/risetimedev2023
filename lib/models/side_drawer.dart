import 'package:flutter/material.dart';
import 'package:risetimedev2023/models/custom_list_tile.dart';
import 'package:risetimedev2023/models/menu_model.dart';
import 'package:risetimedev2023/notifiers/menu_notifier.dart';
import 'package:provider/provider.dart';

class CustomSideDrawer extends StatefulWidget {
  @override
  _CustomSideDrawerState createState() => _CustomSideDrawerState();
}

late int currentSelectedIndex;

class _CustomSideDrawerState extends State<CustomSideDrawer> {
  @override
  void initState() {
    MenuDrawerNotifier menuDrawerNotifier =
    Provider.of<MenuDrawerNotifier>(context, listen: false);
    currentSelectedIndex = menuDrawerNotifier.getCurrentDrawer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Provider.of<MenuDrawerNotifier>(context, listen: false);

    return Container(
      width: 250,
      color: Colors.blue,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CustomListTile(
            onTap: () {
              switch (index) {
                case 0:
                  drawer.setCurrentDrawer(0);
                  Navigator.popAndPushNamed(context, "home");
                  break;

                case 1:
                  drawer.setCurrentDrawer(1);
                  Navigator.popAndPushNamed(context, "signup");
                  break;

                case 2:
                  drawer.setCurrentDrawer(2);
                  Navigator.popAndPushNamed(context, "login");
                  break;

                case 3:
                  drawer.setCurrentDrawer(3);
                  Navigator.popAndPushNamed(context, "seotalep");
                  break;

                case 4:
                  drawer.setCurrentDrawer(4);
                  Navigator.popAndPushNamed(context, "adminlogin");
                  break;
                case 5:
                  drawer.setCurrentDrawer(5);
                  Navigator.popAndPushNamed(context, "domainfirms");
                  break;
                case 6:
                  drawer.setCurrentDrawer(6);
                  Navigator.popAndPushNamed(context, "hostings");
                  break;
                case 7:
                  drawer.setCurrentDrawer(7);
                  Navigator.popAndPushNamed(context, "adsenses");
                  break;
                case 8:
                  drawer.setCurrentDrawer(8);
                  Navigator.popAndPushNamed(context, "domains");
                  break;
                case 9:
                  drawer.setCurrentDrawer(9);
                  Navigator.popAndPushNamed(context, "dailydatas");
                  break;
                case 10:
                  drawer.setCurrentDrawer(10);
                  Navigator.popAndPushNamed(context, "settings");
                  break;
              }
            },
            title: navigationItems[index].title,
            isSelected: currentSelectedIndex == index,
            icon: navigationItems[index].icon,
          );
        },
        itemCount: navigationItems.length,
      ),
    );
  }
}
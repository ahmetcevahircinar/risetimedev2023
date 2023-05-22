import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String? title;
  final IconData? icon;
  bool? isSelected = false;
  final Function()? onTap;

  CustomListTile({Key? key, this.title, this.icon, this.onTap, this.isSelected})
      : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: (widget.isSelected!)
              ? Colors.transparent.withOpacity(1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: widget.isSelected! ? Colors.pink : Colors.white,
            ),
            SizedBox(width: 5),
            Text(widget.title!,
                style: TextStyle(
                  color: (widget.isSelected!) ? Colors.pink : Colors.white,
                  fontSize: 20,
                )),
          ],
        ),
      ),
    );
  }
}
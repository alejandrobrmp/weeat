import 'package:flutter/material.dart';
import 'package:we_eat/themes/apptheme.dart';

class IconButton extends StatelessWidget {

  String text;
  IconData icon;
  bool vertical;
  bool isSelected;
  Function onTap;

  IconButton({this.text, this.icon, this.vertical = true, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return vertical == true ? verticalLayout(context) : horizontalLayout(context);
  }

  Widget horizontalLayout(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Center(child: Icon(icon, color: isSelected ? Theme.of(context).accentColor : Colors.black))),
            Expanded(child: Text(text, style: isSelected ? kIconButtonSelectedTextStyle : kIconButtonTextStyle,)),
          ],
        ),
      ),
    );
  }

  Widget verticalLayout(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Center(child: Icon(icon, color: isSelected ? Theme.of(context).accentColor : Colors.black))),
            Expanded(child: Center(child: Text(text, style: isSelected ? kIconButtonSelectedTextStyle : kIconButtonTextStyle,)))
          ],
        ),
      ),
    );
  }
}


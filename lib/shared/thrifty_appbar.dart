import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/shared/thrifty_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThriftyAppBar extends StatelessWidget {
  const ThriftyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return SizedBox(
      height: 120,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: thriftyBlue,
            icon: Icon(Icons.menu),
          ),
          SizedBox(width: 10),
          ThriftyLogo(size: 80),
          Spacer(),
          buildCircleAvatar(user),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  CircleAvatar buildCircleAvatar(User user) {
    if (user != null) {
      return CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(user.photoURL),
      );
    } else {
      return CircleAvatar(
        radius: 25,
        backgroundColor: thriftyBlue,
      );
    }
  }
}
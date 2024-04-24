import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Lang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.language),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text('Choose Language'),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('English'),
                  onTap: () {
                    context.setLocale(Locale('en'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Русский'),
                  onTap: () {
                    context.setLocale(Locale('ru'));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Kazakh'),
                  onTap: () {
                    context.setLocale(Locale('kk'));
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lesan/core/utils/constants.dart';

class SharedDrawer extends StatelessWidget {

  void openSelector(BuildContext parentContext) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ip = prefs.getString(IP_ADDRESS_KEY);
    String newIp = '';

    showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(title: Text("Change Ip"), children: <Widget>[
          SimpleDialogOption(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'http://ipadress:port'
                    ),
                    initialValue: ip,
                    onChanged: (val) => newIp = val,
                  ),
                  RaisedButton(
                    child: Text('Change'),
                    onPressed: () {
                      Navigator.pop(parentContext);
                      Navigator.pop(parentContext);
                      prefs.setString(IP_ADDRESS_KEY, newIp);
                    },
                  )
                ],
              )
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Sms App'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Ip Address'),
            trailing: Icon(Icons.computer),
            onTap: () => openSelector(context),
          ),
        ],
      ),
    );
  }
}

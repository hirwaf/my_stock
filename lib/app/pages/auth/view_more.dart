import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ViewMore extends StatelessWidget {
  static final String routeName = 'view';

  final String selectedUrl;

  const ViewMore({Key key, this.selectedUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new WebviewScaffold(
        url: selectedUrl,
        appBar: new AppBar(
          title: const Text('My Stock Details'),
        ),
        withZoom: true,
        withLocalStorage: true,
      ),
    );
  }

}

import 'package:flutter/material.dart';

import 'default_text.dart';

class DefaultAppbar extends StatelessWidget {
  const DefaultAppbar(
      {Key? key, required this.title, this.automaticallyImplyLeading = false})
      : super(key: key);
  final String title;
  final bool? automaticallyImplyLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: DefaultText(
        text: title,
        fontSize: 20,
        textColor: Colors.white,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading!,
      centerTitle: true,
    );
  }
}

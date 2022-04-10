import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextFieldWidget extends StatefulWidget {
  CupertinoTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<CupertinoTextFieldWidget> createState() =>
      _CupertinoTextFieldWidgetState();
}

class _CupertinoTextFieldWidgetState extends State<CupertinoTextFieldWidget> {
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          child: CupertinoTextField(
            placeholder: "Enter you name",
            prefix: Icon(Icons.person),
            suffix: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {},
            ),
            // 不可编辑时可见
            suffixMode: OverlayVisibilityMode.notEditing,
            clearButtonMode: OverlayVisibilityMode.editing,
          ),
        ),
        CupertinoTextField(
          controller: _password,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.black, Colors.white, Colors.black],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(offset: Offset(4, 4), blurRadius: 4)
              ]),
          padding: const EdgeInsets.all(24),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  double value = 0.2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Common(
          title: 'show dialog',
          subtitle: SizedBox(
            child: ElevatedButton(
              child: const Text('show dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 30,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.new_label),
                        label: Text('new label'),
                        onPressed: () {
                          // AlertDialog(
                          //   title: const Text('alert dialog demo'),
                          //   content: const Text(
                          //       'would you like to continue learning about dialog in flutter?'),
                          //   actions: [
                          //     TextButton(
                          //       child: const Text('cancel'),
                          //       onPressed: () {
                          //         Navigator.of(context).pop();
                          //       },
                          //     ),
                          //     TextButton(
                          //       child: const Text('ok'),
                          //       onPressed: () {
                          //         Navigator.of(context).pop();
                          //       },
                          //     ),
                          //   ],
                          // );

                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text('alert dialog'),
                                content: Text(
                                    'would you like to continue learning about dialog in flutter?'),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Common(
          title: 'alert dialog',
          subtitle: TextButton(
            child: const Text('alert dialog'),
            onPressed: () async {
              final result = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    title: const Text('房琪语录'),
                    content: const Text('他强任他强，清风拂山岗！'),
                    actions: [
                      TextButton(
                        child: const Text('取消'),
                        onPressed: () {
                          Navigator.of(context).pop('cancel');
                        },
                      ),
                      TextButton(
                        child: const Text('赞'),
                        onPressed: () {
                          Navigator.of(context).pop('confirm');
                        },
                      ),
                    ],
                  );
                },
              );
              print('result is 👉 $result');
            },
          ),
        ),
        ElevatedButton(
          child: const Text('调节音量'),
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('调节音量'),
                  content: IntrinsicHeight(
                    child: Slider(
                      value: value,
                      onChanged: (v) {
                        print('v is 👉 $v');
                        setState(() => value = v);
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('取消'),
                      onPressed: () {
                        Navigator.of(context).pop(value);
                      },
                    ),
                    TextButton(
                      child: const Text('确定'),
                      onPressed: () {
                        Navigator.of(context).pop(value);
                      },
                    ),
                  ],
                );
              },
            );
            print('result is 👉 $result');
          },
        ),
        ElevatedButton(
          child: const Text('示例'),
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('dialog'),
                  content: const Text('dialog content'),
                  titlePadding: EdgeInsets.only(left: 80),
                  titleTextStyle: TextStyle(fontSize: 24),
                  contentPadding: EdgeInsets.zero,
                  contentTextStyle: TextStyle(fontSize: 20),
                  insetPadding: EdgeInsets.zero,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  backgroundColor: Colors.blueGrey,
                  actions: [
                    Container(
                      width: 120,
                      height: 36,
                      margin: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        child: const Text('取消'),
                        onPressed: () {
                          Navigator.of(context).pop(value);
                        },
                      ),
                    ),
                    TextButton(
                      child: const Text('确定'),
                      onPressed: () {
                        Navigator.of(context).pop(value);
                      },
                    ),
                  ],
                );
              },
            );
            print('result is 👉 $result');
          },
        ),
        ElevatedButton(
          child: const Icon(Icons.language_rounded),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('语言选择'),
                  content: Container(
                    height: 400,
                    constraints: const BoxConstraints(maxHeight: 700),
                    child: Column(
                      children: [
                        ListView(
                          // mainAxisSize: MainAxisSize.min,
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              title: const Text('中文'),
                              onTap: () {
                                Navigator.of(context).pop('中文');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Navigator.of(context).pop('English');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class Common extends StatelessWidget {
  String title;
  Widget subtitle;

  Common({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        subtitle: subtitle,
      ),
    );
  }
}

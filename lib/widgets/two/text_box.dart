import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
  }) : super(key: key);

  // List _style = [
  //   const TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.black,
  //   ),
  //   const TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.black,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      // color: Colors.white,
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 16),
      children: <Widget>[
        ListTile(
          title: Container(
            height: 36,
            margin: const EdgeInsets.only(top: 12),
            child: const Text('概念'),
          ),
          subtitle: const Text(
              'Text 用于显示简单样式文本，它包含一些控制文本显示样式的一些属性，其中最常用的是文本样式。内容就是需要显示的文本，类型是String。注意：需要显示的文本可以是空字符串（""），但是不能是null。在Flutter 2.0之前，传入 null 会导致运行时错误；在Flutter 2.0启用空安全后，传入 null 会导致代码无法编译。'),
        ),
        Container(
            margin: const EdgeInsets.only(top: 16),
            child: ListTile(
              title: SizedBox(
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      '常用属性',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      iconSize: 18,
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () async {
                        const _url =
                            'https://api.flutter.dev/flutter/widgets/Text-class.html';
                        if (!await launch(_url)) {
                          throw 'Could not launch $_url';
                        }
                      },
                    ),
                  ],
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  ListTile(
                    // minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    title: Text('fontSize'),
                    subtitle: Text('字体大小, 可以传入一个小数类型，默认值为14.0。'),
                  ),
                  ListTile(
                    title: Text('fontWeight'),
                    subtitle: Text(
                        '字体粗细信息，包括w100、w200、w300、w400、w500、w600、w700、w800、w900；默认值为w400；w100最细，w400正常，w700粗体，w900最粗。'),
                  ),
                  ListTile(
                    title: Text('fontStyle'),
                    subtitle: Text(
                        '字体样式信息，只有2个可选值：FontStyle.normal和FontStyle.italic；默认值为normal。'),
                  ),
                  ListTile(
                    title: Text('自定义字体'),
                    subtitle: Text(
                        '若想使用非系统自带的字体，需要先讲字体文件放在项目的目录内，并在pubspec.yaml里设置目录路径，例如：FontFamily: "Roboto"。'),
                  ),
                  ListTile(
                    title: Text('color and backgroundColor'),
                    subtitle: Text(
                        'color和backgroundColor属性是Text的两个必须属性，它们分别表示文本的颜色和背景颜色；传入类型均为Color，默认值为Colors.black。'),
                  ),
                  Text(
                    'Sample TextStyle',
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: 28),
                  ),
                  Text(
                    '同时设置多个属性',
                    style: TextStyle(color: Colors.white, fontSize: 28,
                        // decoration: TextDecoration.underline,
                        shadows: [
                          BoxShadow(
                            offset: Offset(-2, -1),
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                          BoxShadow(
                            offset: Offset(-2, -2),
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                          BoxShadow(
                            offset: Offset(2, -2),
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                        ]),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

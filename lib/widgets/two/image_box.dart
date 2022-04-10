import 'dart:convert';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Image'),
            subtitle: Column(
              children: const [
                ListTile(
                  title: Text('网络图片（NetworkImage）'),
                  subtitle: Image(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                ),
                ListTile(
                  title: Text('设备文件加载（FileImage）'),
                  subtitle: Text(
                      '根据文件路径的不同，可能需要读取用户数据，涉及用户隐私，需要在应用程序的 manifest 文件中声明相关权限'),
                ),
                ListTile(
                  title: Text('项目内的文件加载（AssetImage，又称资源包文件加载）'),
                  subtitle: Image(
                    image: AssetImage('assets/images/genie.jpg'),
                  ),
                ),
                ListTile(
                  title: Text('MemoryImage, 内存图片, '),
                  subtitle: Text(
                      'Image组件可以快速从内存中的一个Uint8List字节加载图片；Uint8List是一个固定长度的8位无符号整数列表，可以用来存储任何二进制信息，比如：图片的像素数据。如果需要文本形式展示字节列内容，则最常见的做法是蚕蛹base64编码形式，在Flutter框架中，dart:convert包里的base64Decode方法可以将base64编码的字符串转换为Uint8List；如果需要将Uint8List转换为图片，则需要使用Image.memory方法，该方法接受一个Uint8List参数，并返回一个Image对象。'),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('color and blend mode'),
            subtitle: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/genie.jpg',
                  color: Colors.blueGrey[600],
                  colorBlendMode: BlendMode.softLight,
                  gaplessPlayback: true,
                ),
                Image.asset(
                  'assets/images/genie.jpg',
                  color: Colors.grey[700],
                  colorBlendMode: BlendMode.softLight,
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('loadingBuilder'),
            subtitle: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              // loadingBuilder: (context, child, loadingProgress) {
              //   // done
              //   if (loadingProgress == null) return child;
              //   // loading
              //   final double percent = loadingProgress.cumulativeBytesLoaded /
              //       loadingProgress.expectedTotalBytes *
              //       100;
              //   return Text('loading... ${percent.toStringAsFixed(2)}%');
              // },
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                  child,
            ),
          )
        ],
      ),
    );
  }
}

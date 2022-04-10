import 'package:flutter/material.dart';
import 'package:learn_book/widgets/three/controller.dart';
import 'package:learn_book/widgets/three/cupertino_text_field.dart';
import 'package:learn_book/widgets/three/field.dart';

class ChapterThree extends StatefulWidget {
  const ChapterThree({Key? key}) : super(key: key);

  @override
  State<ChapterThree> createState() => _ChapterThreeState();
}

class _ChapterThreeState extends State<ChapterThree> {
  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            // 中间文字
            title: const Text(
              'Text or Image',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            titleTextStyle: const TextStyle(color: Colors.black),
            centerTitle: true,
            // 背景色
            backgroundColor: Colors.white,
            // 左边返回按钮
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
              iconSize: scale * 20,
            ),

            bottom: TabBar(
              indicatorColor: Colors.deepOrange, //指示器颜色
              indicatorWeight: 1, //指示器高度
              //指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
              indicatorSize: TabBarIndicatorSize.label, //指示器大小,底部边框
              labelColor: Colors.deepOrange, //选中label颜色
              unselectedLabelColor: Colors.black, //未选中label颜色边框

              // 点击事件
              onTap: (index) {
                print('点击了 $index');
              },
              tabs: const [
                Tab(text: 'TextField'),
                Tab(text: 'Controller'),
                Tab(text: 'cupertino'),
                Tab(text: 'show'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TextFieldWidget(),
              UserController(),
              CupertinoTextFieldWidget(),
              Image.asset('assets/images/genie.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learn_book/widgets/nine/bottom_sheet.dart';
import 'package:learn_book/widgets/nine/composited_transform_follower.dart';
import 'package:learn_book/widgets/nine/dialog.dart';
import 'package:learn_book/widgets/nine/overlayEntryWidget.dart';

class ChapterNine extends StatefulWidget {
  const ChapterNine({Key? key}) : super(key: key);

  @override
  State<ChapterNine> createState() => _ChapterNineState();
}

class _ChapterNineState extends State<ChapterNine> {
  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      body: DefaultTabController(
        // tab的个数
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            // 中间文字
            title: const Text(
              '异步操作',
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
              isScrollable: true,
              // 点击事件
              onTap: (index) {
                print('点击了 $index');
              },
              tabs: const [
                Tab(text: 'overlayEntry'),
                Tab(text: 'compositedTransformFollower'),
                Tab(text: 'dialog'),
                Tab(text: 'bottom sheet'),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              OverlayEntryWidget(),
              CompositedTransformFollowerWidget(),
              DialogWidget(),
              BottomSheetWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

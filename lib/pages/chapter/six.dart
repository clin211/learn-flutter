import 'package:flutter/material.dart';
import 'package:learn_book/widgets/six/boundaries/one.dart';

class ChapterSix extends StatefulWidget {
  ChapterSix({Key? key}) : super(key: key);

  @override
  State<ChapterSix> createState() => _ChapterSixState();
}

class _ChapterSixState extends State<ChapterSix> {
  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      body: DefaultTabController(
        // tab的个数
        length: 1,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            // 中间文字
            title: const Text(
              '布局进阶',
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

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 44,
                      child: TabBar(
                        isScrollable: true,
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
                          Tab(text: '边界'),
                          // Tab(text: 'scroll controller'),
                          // Tab(text: 'wheel scroll'),
                          // Tab(text: 'demo'),
                          // Tab(text: 'drag'),
                          // Tab(text: 'grid view'),
                          // Tab(text: 'page view'),
                          // Tab(text: 'scroll configuration'),
                          // Tab(text: 'notification listener')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              BoundariesOne(),
            ],
          ),
        ),
      ),
    );
  }
}

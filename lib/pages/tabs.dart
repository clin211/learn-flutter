import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // 定义两个滚动控制器
  ScrollController _controller = ScrollController();
  ScrollController _controller2 = ScrollController();

  // tabs
  final tabs = ['scrollbar', 'refresh indicator', 'dismissible'];

  //
  final list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Detail',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.deepOrange, //指示器颜色
            indicatorWeight: 1, //指示器高度
            // 指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
            indicatorSize: TabBarIndicatorSize.tab, //指示器大小,底部边框
            labelColor: Colors.deepOrange, //选中label颜色
            unselectedLabelColor: Colors.black, //未选中label颜色边框
            tabs: tabs
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            RefreshIndicator(
              color: Colors.deepOrange,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
                setState(() {
                  list.insert(0, 21);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 600,
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 12,
                  bottom: 12,
                ),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: list.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (direction) async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('确认删除'),
                                content: const Text('确认删除吗？'),
                                actions: [
                                  ElevatedButton(
                                    child: const Text('取消'),
                                    onPressed: () {
                                      // Navigator.of(context).pop(false);
                                    },
                                  ),
                                  ElevatedButton(
                                    child: const Text('确认'),
                                    onPressed: () {
                                      // Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          return result ?? false;
                        },
                        child: Container(
                          height: 50,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(top: 6),
                          alignment: Alignment.center,
                          child: Text('${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 12,
                bottom: 12,
              ),
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 200,
                  controller: _controller2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${index + 1}'),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 12,
                bottom: 12,
              ),
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 200,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${index + 1}'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

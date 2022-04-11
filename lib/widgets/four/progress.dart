import 'package:flutter/material.dart';
import 'package:learn_book/widgets/common/colorful.dart';

class ProgressWidget extends StatefulWidget {
  ProgressWidget({Key? key}) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              ListTile(
                title: const Text('通过value控制进度'),
                subtitle: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CircularProgressIndicator(
                    value: .7,
                    valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
                  ),
                ),
              ),
              const ListTile(
                title: Text('strokeWidth、valueColor'),
                subtitle: SizedBox(
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 1, // 进度条粗细
                    valueColor: AlwaysStoppedAnimation(Colors.red), // 已有进度颜色值
                  ),
                ),
              ),
              ListTile(
                title: const Text('进度条背景颜色'),
                subtitle: CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade200, // 进度条背景颜色
                  valueColor: const AlwaysStoppedAnimation(Colors.green),
                ),
              ),
              const ListTile(
                title: Text(''),
                subtitle: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              ListTile(
                title: const Text('尺寸与背景'),
                subtitle: Wrap(
                  spacing: 10, // 横向间距
                  runSpacing: 20, // 纵向间距
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircularProgressIndicator(
                        value: .7,
                        valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircularProgressIndicator(
                        value: .7,
                        valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircularProgressIndicator(
                        value: .7,
                        valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircularProgressIndicator(
                        value: .7,
                        valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('补间动画'),
                subtitle: Wrap(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(top: 16),
                      child: Colorful(),
                    )
                  ],
                ),
              ),
              ListTile(
                title: const Text('线性进度条'),
                subtitle: Wrap(
                  children: [
                    LinearProgressIndicator(
                      minHeight: 1,
                      valueColor:
                          const AlwaysStoppedAnimation(Colors.deepOrange),
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

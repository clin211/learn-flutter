import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // 解决无限高度问题
      children: [
        Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .94,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(decorationColor: Colors.grey),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.grey),
                        // clear
                        suffix: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => print('clear'),
                        ),
                        hintText: 'Enter email',
                      ),
                      onSubmitted: (value) => print('submit: $value'),
                    ),
                    TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        counterText: "0/14",
                        hintText: 'Enter password',
                        suffix: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => print('clear'),
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () => print('lock'),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.grey),
                        suffix: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () => print('lock'),
                        ),
                        hintText: 'Enter password',
                      ),
                    ),
                    Container(
                      // height: 56,
                      margin: const EdgeInsets.only(top: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          // isDense: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14, right: 14, top: 8, bottom: 8),
                          labelText: "Date of Birth",
                          hintText: "Enter date of birth",
                          helperText: "Format: yyyy-MM-dd",

                          // 无聚焦时的边框
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),

                          // 聚焦时的边框
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 56,
                      margin: const EdgeInsets.only(top: 18),
                      child: const TextField(
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        decoration: InputDecoration(
                          hintText: '组件的尺寸控制',
                          hintStyle: TextStyle(fontSize: 10),
                          labelText: 'size',
                          labelStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * .94,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFfffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // 当设置最大长度时，右下角会自动显示计数器
                    const TextField(
                      maxLength: 10,
                      decoration: InputDecoration(
                        hintText: '最大长度为10',
                        labelText: '实时更新数据',
                      ),
                    ),

                    // 没有限制最大长度，但保留自动计数的功能
                    const TextField(
                      maxLength: TextField.noMaxLength,
                      decoration: InputDecoration(
                        hintText: '没有长度限制',
                        labelText: '实时更新数据',
                      ),
                    ),

                    // 需要设置最大长度时，右下角隐藏计数器
                    TextField(
                      maxLength: 10,
                      decoration: const InputDecoration(
                        hintText: '有长度限制',
                        labelText: '右下角隐藏计数器',
                      ),
                      buildCounter: (
                        BuildContext context, {
                        required int currentLength,
                        required int? maxLength,
                        required bool isFocused,
                      }) {
                        return const Text('');
                      },
                    ),

                    // 需要设置最大长度，且自定义计数器
                    TextField(
                      maxLength: 10,
                      decoration: const InputDecoration(
                        hintText: '有长度限制',
                        labelText: '自定义计数器',
                      ),
                      buildCounter: (
                        BuildContext context, {
                        required int currentLength,
                        required int? maxLength,
                        required bool isFocused,
                      }) {
                        return Text('还可输入：${maxLength! - currentLength}');
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * .94,
                padding: const EdgeInsets.only(
                    left: 16, right: 24, top: 24, bottom: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFfffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: const Text('内容过滤'),
                  subtitle: Column(
                    children: [
                      TextField(
                        inputFormatters: [
                          // 将用户输入zzz替换成Zzz...
                          FilteringTextInputFormatter.deny(
                            'zzz',
                            replacementString: "Zzz...",
                          ),

                          FilteringTextInputFormatter.deny(
                              // RegExp(r'[\u4e00-\u9fa5]'), // 将中文替换成 *
                              RegExp(r'[aeiou]'), // 将aeiou替换成 *
                              replacementString: "*"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * .94,
                padding: const EdgeInsets.only(
                    left: 16, right: 24, top: 24, bottom: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFfffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: const [
                    ListTile(
                      title: Text(
                          '复制文本的高度问题，当被选择的文本高度不一的时候，使用次属性，selectionHeightStyle: BoxHeightStyle.max,'),
                      subtitle: TextField(
                        // 当文本高度不一的时候，使用次属性
                        selectionHeightStyle: BoxHeightStyle.max,
                        decoration: InputDecoration(
                          hintText: '演示输入框选中文本高度不一的情况',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Text('交互菜单；如：复制、粘贴、全选、剪切'),
                      subtitle: TextField(
                        decoration: InputDecoration(
                          hintText: '交互菜单',
                        ),
                        enableInteractiveSelection: true,
                        toolbarOptions: ToolbarOptions(
                          copy: true,
                          paste: true,
                          cut: true,
                          selectAll: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * .94,
                padding: const EdgeInsets.only(
                    left: 16, right: 24, top: 24, bottom: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFfffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: const [
                    ListTile(
                      title: Text('数据控制器'),
                      subtitle: TextField(
                        // decoration: InputDecoration(
                        //   hintText: '自定义输入框',
                        // ),
                        // iOS 键盘改为深色模式
                        keyboardAppearance: Brightness.dark,

                        // 键盘改为输入电子邮箱
                        keyboardType: TextInputType.emailAddress,

                        // keyboardAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: MediaQuery.of(context).size.width * .94,
                padding: const EdgeInsets.only(
                    left: 16, right: 24, top: 24, bottom: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFfffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: const [
                    ListTile(
                      title: Text('自定义输入框'),
                      subtitle: TextField(
                        // decoration: InputDecoration(
                        //   hintText: '自定义输入框',
                        // ),
                        // iOS 键盘改为深色模式
                        keyboardAppearance: Brightness.dark,

                        // 键盘改为输入电子邮箱
                        keyboardType: TextInputType.emailAddress,

                        // keyboardAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Text('自定义输入框'),
                      subtitle: TextField(
                        decoration: InputDecoration(
                          hintText: '自定义输入框',
                        ),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                        cursorColor: Colors.blue,
                        cursorWidth: 5,
                        cursorRadius: Radius.circular(10),
                        // cursorOffset: Offset(0, 10),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        textDirection: TextDirection.rtl,
                        textCapitalization: TextCapitalization.words,
                        autocorrect: false,
                        autofocus: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

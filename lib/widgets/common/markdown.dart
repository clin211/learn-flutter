import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownWidget extends StatelessWidget {
  const MarkdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Markdown(
      data: md,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      //syntaxHighlighter: HighLight(),
    );
  }
}

const md = '''
# Text or Image
## 组件相关

- 如何实现一个自定义字体的Text组件？

# React 源代码调试方法

## 克隆源代码

> GitHub仓库地址：[https://github.com/facebook/react](https://github.com/facebook/react)

## 目录结构认识

```tree

```

## 运行源码

### 安装依赖

> 安装依赖之前，可在源码的`package.json`中查看`Node.js`支持的版本，如下图：
>
> ![image-20220211131935391](https://gitbook-media.oss-ap-southeast-1.aliyuncs.com/pics/image-20220211131935391.png)
>
> 然后再通过`yarn install`或者`npm install`安装依赖

### 调试

官方文档的[调试流程说明](https://zh-hans.reactjs.org/docs/how-to-contribute.html#development-workflow)，可以按照官方提供的流程进行操作；我下面来调试react和react dom两个库，所以执行流程如下：

#### 调试方法一：单文件调试

- 运行命令：

```shell
\$ yarn build react/index,react-dom/index --type=UMD
```

> 运行命令后就会去构建生产和开发环境的文件， 如下图：
>
> ![image-20220211132833736](https://gitbook-media.oss-ap-southeast-1.aliyuncs.com/pics/image-20220211132833736.png)

- 找到调试文件，路径如下：`fixtures/packaging/babel-standalone/dev.html`，内容如下：

```html
<html>
<body>
  <script src="../../../build/node_modules/react/umd/react.development.js"></script>
  <script src="../../../build/node_modules/react-dom/umd/react-dom.development.js"></script>
  <script src="https://unpkg.com/babel-standalone@6/babel.js"></script>
  <div id="container"></div>
  <script type="text/babel">
    ReactDOM.render(
      <h1>Hello World!</h1>,
      document.getElementById('container')
    );
  </script>
</body>
</html>
```

这个文件分别引入了，上面命令构建的`react`和`react-dom`文件，然后在浏览器中打开`dev.html`，这样就可以调试源码了



#### 调试方法二：在已有的项目中进行调试

- 运行命令

```shell
\$ yarn build react/index,react/jsx,react-dom/index,scheduler --type=NODE
```

> Tips:
>
> 当请在构建时，传递 `--type=NODE`，而不是 `--type=UMD`

运行后如下：

![image-20220211134203494](https://gitbook-media.oss-ap-southeast-1.aliyuncs.com/pics/image-20220211134203494.png)

然后`/build/node_modules`文件中就是上面命令构建的文件，如下：

![image-20220211140736278](https://gitbook-media.oss-ap-southeast-1.aliyuncs.com/pics/image-20220211140736278.png)



- 使用 `yarn link` 将其指向本地文件夹的 `build` 目录

```shell
# link react库
\$ cd build/node_modules/react
\$ yarn link

# link react-dom库
\$ cd build/node_modules/react-dom
\$ yarn link
```

![image-20220211142645783](https://gitbook-media.oss-ap-southeast-1.aliyuncs.com/pics/image-20220211142645783.png)

- 进入已有项目的react中去`link`调试文件

```shell
# 进入react项目
\$ cd ../react-debugger-demo

# link 调试文件
\$ yarn link react react-dom
```

`link`完成之后，可以在项目中的`node_modules`中查看，如下：

![image-20220211144349053](https://gitbook-media.oss-ap-southeast-1.aliyuncs.com/pics/image-20220211144349053.png)

然后运行项目就可以调试相关代码：

```shell
\$ yarn start
```
''';

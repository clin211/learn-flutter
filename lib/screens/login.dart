import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        // brightness: Brightness.light,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/common/avatar.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: Image.asset(
                'assets/images/common/login_bg.png',
                width: 200,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 < 380
                  ? 400
                  : MediaQuery.of(context).size.height * 0.5,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                elevation: 6,
                margin: const EdgeInsets.all(30),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Login ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff55687A),
                              ),
                            ),
                            TextSpan(
                              text: 'SEAGM',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  color: Color(0xff55687A)),
                            ),
                            TextSpan(
                              text: ' Account',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff55687A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        // controller: _loginEmail,
                        // focusNode: _loginEmailFoucs,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Color(0xffcccccc),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //提供默认值，各种状态没有专门指定会采用这里的部分设置
                          border: const OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(22),
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                          ),
                          //禁用状态
                          disabledBorder: const OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(22),
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                          ),
                          //获得焦点时
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide:
                                BorderSide(color: Color(0xfff5f5f5), width: 1),
                          ),
                          //普通状态 未禁用 无焦点
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide:
                                BorderSide(color: Color(0xfff5f5f5), width: 1),
                          ),
                        ),
                      ),
                      TextField(
                        // controller: _password,
                        // focusNode: _passwordFoucs,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color(0xffcccccc),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //提供默认值，各种状态没有专门指定会采用这里的部分设置
                          border: const OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(22),
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                          ),
                          //禁用状态
                          disabledBorder: const OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(22),
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                          ),
                          //获得焦点时
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: const BorderSide(
                                color: Color(0xfff5f5f5), width: 1),
                          ),
                          //普通状态 未禁用 无焦点
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: const BorderSide(
                                color: Color(0xfff5f5f5), width: 1),
                          ),
                        ),
                      ),
                      Flexible(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () async {
                            print('object');
                          },
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 100,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      FlatButton(
                          onPressed: () {
                            print('comming soon...');
                          },
                          child: const Text(
                            'Forget password',
                            style: TextStyle(
                              color: Color(0xff55697A),
                              fontSize: 12,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 750 / 5),
              dense: true,
              title: Text(
                '设为Staging运行环境',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              value: true,
              onChanged: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

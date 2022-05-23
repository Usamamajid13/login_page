import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isObscure = true;
  bool visible = false;
  bool loginClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E343B),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/logo.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login into your existing account by entering your e-mail and password.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey[400]),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: (emailController.text.isEmpty &&
                                      visible != true)
                                  ? Colors.grey
                                  : visible
                                      ? Colors.red
                                      : const Color(0xff7B55D3),
                              width: 1.4)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.mail_outline_sharp,
                                size: 20,
                                color: (emailController.text.isEmpty &&
                                        visible != true)
                                    ? Colors.grey
                                    : visible
                                        ? Colors.red
                                        : const Color(0xff7B55D3),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "E-Mail",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14),
                              )
                            ],
                          ),
                          TextField(
                            onChanged: (text) {
                              setState(() {});
                            },
                            controller: emailController,
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.8)),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(0.0),
                                isDense: true,
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                hintText: "Enter your e-mail"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: (passwordController.text.isEmpty &&
                                      visible != true)
                                  ? Colors.grey
                                  : visible
                                      ? Colors.red
                                      : const Color(0xff7B55D3),
                              width: 1.4)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lock_outline,
                                size: 20,
                                color: (passwordController.text.isEmpty &&
                                        visible != true)
                                    ? Colors.grey
                                    : visible
                                        ? Colors.red
                                        : const Color(0xff7B55D3),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  obscureText: isObscure,
                                  onChanged: (text) {
                                    setState(() {});
                                  },
                                  controller: passwordController,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(0.0),
                                      isDense: true,
                                      hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      hintText: "Enter your password"),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    isObscure = !isObscure;
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                    size: 20,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: visible ? 160 : 180,
                    ),
                    visible
                        ? Column(
                            children: const [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Incorrect e-mail & password combination",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Container(),
                    GestureDetector(
                      onTap: (emailController.text.isEmpty ||
                              passwordController.text.isEmpty)
                          ? () {}
                          : () {
                              if (!emailController.text.contains("@") ||
                                  passwordController.text.contains("_")) {
                                visible = true;
                                setState(() {});
                              } else {
                                visible = false;
                                if (loginClick == false) {
                                  showDialogBoxWithLoading();
                                  Timer(Duration(seconds: 2), () {
                                    Navigator.pop(context);
                                  });
                                  loginClick = true;
                                  setState(() {});
                                } else {
                                  loginClick = false;
                                }
                                setState(() {});
                              }
                            },
                      child: Container(
                        decoration: BoxDecoration(
                            color: (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty)
                                ? const Color(0xff2E343B)
                                : const Color(0xff7B55D3),
                            border: Border.all(
                                color: (emailController.text.isEmpty ||
                                        passwordController.text.isEmpty)
                                    ? Colors.grey
                                    : const Color(0xff7B55D3),
                                width: 1.4),
                            borderRadius: BorderRadius.circular(15)),
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: loginClick == false
                              ? Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: const Color(0xff2E343B),
                                    color: Colors.grey[700],
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? Let's ",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[400]),
                        ),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff7B55D3)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showDialogBoxWithLoading() {
    return showDialog(
        context: context,
        builder: (_) => Dialog(
              backgroundColor: Colors.transparent,
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0xff252B31),
                      borderRadius: BorderRadius.circular(15)),
                  child: CircularProgressIndicator(
                    backgroundColor: const Color(0xff7B55D3),
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ));
  }
}

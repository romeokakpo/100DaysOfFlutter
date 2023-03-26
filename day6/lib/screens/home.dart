import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_prrovider.dart';
import '../widgets/button.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AppProvider appState = context.watch<AppProvider>();
    bool mode = appState.mode;
    String entered = appState.enteredText;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: mode
                        ? Color.fromARGB(7, 66, 66, 66)
                        : Color.fromARGB(110, 66, 66, 66)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      color: mode ? null : Colors.grey,
                      onPressed: () {
                        appState.setMode(true);
                      },
                      icon: Icon(Icons.wb_sunny_outlined),
                    ),
                    IconButton(
                        color: mode ? Colors.grey : null,
                        onPressed: () {
                          appState.setMode(false);
                        },
                        icon: Icon(Icons.dark_mode_outlined))
                  ],
                ),
              )
            ],
          ),
          backgroundColor: mode ? Color(0xffffffff) : Color(0xff22252d),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            color: mode ? Color(0xffffffff) : Color(0xff22252d),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 50, right: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  entered,
                                  style: TextStyle(fontSize: 25),
                                  overflow: TextOverflow.fade,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  appState.result,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                )
                              ],
                            )
                          ]),
                    )),
                Expanded(
                  flex: 4,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: mode ? Color(0xfff9f9f9) : Color(0xff292d36),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(35))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 20, left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Button(
                                content: "AC",
                                color: Color(0xff26FBD4),
                              ),
                              Button(
                                content: "+/-",
                                color: Color(0xff26FBD4),
                              ),
                              Button(
                                content: "%",
                                color: Color(0xff26FBD4),
                              ),
                              Button(
                                content: "÷",
                                color: Color(0xffeb6666),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Button(
                                content: "7",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "8",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "9",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "x",
                                color: Color(0xffeb6666),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Button(
                                content: "4",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "5",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "6",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "-",
                                color: Color(0xffeb6666),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Button(
                                content: "1",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "2",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "3",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "+",
                                color: Color(0xffeb6666),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    appState.resetEnteredText();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(60, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      backgroundColor: mode
                                          ? Color(0xfff7f7f7)
                                          : Color(0xff272b33)),
                                  child: Icon(
                                    Icons.replay,
                                    color: mode
                                        ? Color(0xff000000)
                                        : Color(0xffffffff),
                                  )),
                              Button(
                                content: "0",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: ".",
                                color: mode
                                    ? Color(0xff000000)
                                    : Color(0xffffffff),
                              ),
                              Button(
                                content: "=",
                                color: Color(0xffeb6666),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

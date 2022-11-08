import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class TabControllerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabControllerState();
}

class TabControllerState extends State<TabControllerDemo> {
  GlobalKey key = GlobalKey();

  _scrollKey() async {
    final context = key.currentContext;
    await Scrollable.ensureVisible(context!,
        duration: Duration(seconds: 1), alignment: 0.37);
  }

  @override
  void initState() {
    bool checkData = false;

    if (checkData != checkData) {
      print(" if ---- $checkData}");
    } else {
      print(" if ---- $checkData}");

      print("else --- ${checkData}");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = <String>['Tab 1', 'Tab 2', 'Tab 3'];
    return SafeArea(
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          floatingActionButton:
              ElevatedButton(child: Text("dfdf"), onPressed: _scrollKey),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    pinned: true,
                    toolbarHeight: 80,
                    flexibleSpace: Column(
                      children: [
                        // Container(
                        //   color: Colors.white,
                        //   height: 300,
                        //   width: double.infinity,
                        //   child: const Center(child: Text('Upper Content')),
                        // ),
                        Container(
                          color: Colors.blue,
                          child: TabBar(
                            tabs: _tabs
                                .map((String name) => Tab(
                                      text: name,
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              firstWidget(),

              Container(
                height: 50,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('Item $index').p(20);
                    }),
              ),
              secondWidget(),
              // FAQ Widget
            ]),
            // body: TabBarView(
            //   children: _tabs.map((String name) {
            //     return ListView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //         itemCount: 20,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Text('Item $index').p(20);
            //         });
            //   }).toList(),
          ),
        ),
      ),
    );
  }

  Widget firstWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          Container(key: key, child: "offers".text.make().p(20)),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
          "bdjbfdh".text.make().p(20),
        ],
      ),
    );
  }

  Widget secondWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Text('Item $index').p(20);
          }),
    );
  }
}

class Bhainsiya {}
// main(){
//   bool isBhainsiya = false;
//
//      isBhainsiya != isBhainsiya;
//     print(isBhainsiya);
//
//
// }

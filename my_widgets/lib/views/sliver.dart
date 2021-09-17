import 'package:flutter/material.dart';

var list = new List<int>.generate(10, (i) => i + 1);

class SliverScreen extends StatelessWidget {
  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 180.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('SliverAppBar'),
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        background: Container(
          width: double.infinity,
          height: 340,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/xFrame.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return SliverToBoxAdapter(
      child: Center(child: Text(title)),
    );
  }

  Widget _buildGridView() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: Text(index.toString()),
          );
        },
        childCount: 15,
      ),
    );
  }

  Widget _buildListView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // print(index);
          return Container(
            height: 50,
            color: Colors.primaries[(index % 18)],
            child: Center(
              child: Text(
                index.toString(),
              ),
            ),
          );
        },
        childCount: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Silver")),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildTitle("SliverGrid"),
          _buildGridView(),
          _buildTitle("SliverList"),
          _buildListView(),
        ],
      ),
    );
  }
}

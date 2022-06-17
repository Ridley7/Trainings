import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/data/words.dart';
import 'package:flutter/material.dart';

import '../components/home_page/topic_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> _topics = [];

  @override
  void initState() {
    // TODO: implement initState
    for(var t in words){
      if(!_topics.contains(t.topic)){
        _topics.add(t.topic);
      }
      _topics.sort();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04; //Espacio a los lados

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        toolbarHeight: size.height * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: size.width * kIconPadding,
                  child: Image.asset('assets/images/settings.png'),
                ),
                SizedBox(
                  height: size.height * kIconPadding,
                )
              ],
            ),
            Text("Chinese Flashcards\n中文足额西卡", textAlign: TextAlign.center,),

            Column(
              children: [
                SizedBox(
                  width: size.width * kIconPadding,
                  child: Image.asset('assets/images/review.png'),
                ),
                SizedBox(
                  height: size.height * kIconPadding,
                )
              ],
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: Image.asset('assets/images/chinese_dragon.png'),
                ),
              ),
            ),

            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: _topics.length,
                    (context, index) => TopicTile(topic: _topics[index]),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6
                )
            )
          ],
        ),
      ),
    );
  }
}



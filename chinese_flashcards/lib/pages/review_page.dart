import 'package:chinese_flashcards/components/app/custom_app_bar.dart';
import 'package:chinese_flashcards/components/review_page/language_button.dart';
import 'package:chinese_flashcards/components/review_page/review_page.dart';
import 'package:chinese_flashcards/components/review_page/word_tile.dart';
import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/enums/language_type.dart';
import 'package:chinese_flashcards/models/word.dart';
import 'package:flutter/material.dart';


class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  final _listKey = GlobalKey<AnimatedListState>();

  final _reviewWords = [
    Word(topic: 'Beach', english: 'Seashell', character: '贝壳', pinyin: 'Bei Ke'),
    Word(topic: 'Beach', english: 'Sunscreen', character: '防晒霜', pinyin: 'Fáng Shai Shuang'),
    Word(topic: 'Beach', english: 'Surfboard', character: '冲浪板', pinyin: 'Chong Lang Ban'),
    Word(topic: 'Birds', english: 'Kiwi', character: '奇异鸟', pinyin: 'Qi Yi Niao'),
    Word(topic: 'Birds', english: 'Duck', character: '鸭子', pinyin: 'Ya Zi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight),
        child: CustomAppBar(),
      ),

      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  HeaderButton(
                    title: "Insert Card", callback: () {

                      var initialWords = [
                        Word(topic: 'Beach', english: 'Seashell', character: '贝壳', pinyin: 'Bei Ke'),
                        Word(topic: 'Beach', english: 'Sunscreen', character: '防晒霜', pinyin: 'Fáng Shai Shuang'),
                        Word(topic: 'Beach', english: 'Surfboard', character: '冲浪板', pinyin: 'Chong Lang Ban'),
                        Word(topic: 'Birds', english: 'Kiwi', character: '奇异鸟', pinyin: 'Qi Yi Niao'),
                        Word(topic: 'Birds', english: 'Duck', character: '鸭子', pinyin: 'Ya Zi'),
                      ];

                      _insertWords(words: initialWords);

                  },),
                  HeaderButton(title: "Clear Cards", callback: () {
                    _clearAllWords();
                  },)
                ],
              )
          ),

          Expanded(
            flex: 10,
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _reviewWords.length,
                itemBuilder: (context, index, animation) => WordTile(word: _reviewWords[index],
                    animation: animation,
                  index: index,
                  callback: (){
                    _removedWord(word: _reviewWords[index]);
                  },
                ),
              )
          ),

          Expanded(
              flex: 1,
              child: Row(
                children: const [
                  LanguageButton(languageType: LanguageType.image,),
                  LanguageButton(languageType: LanguageType.english,),
                  LanguageButton(languageType: LanguageType.character,),
                  LanguageButton(languageType: LanguageType.pinyin,),
                ],
              )
          )

        ],
      ),
    );
  }

  _insertWords({required List<Word> words}){
    for(int i = 0; i < words.length; i++){
      _listKey.currentState?.insertItem(i);
      _reviewWords.insert(i, words[i]);
    }
  }

  _removedWord({required Word word}){
    var w = word;
    _listKey.currentState?.removeItem(_reviewWords.indexOf(w), (context, animation) =>
        WordTile(word: w, animation: animation, index: _reviewWords.indexOf(w),)
    );
    _reviewWords.remove(w);
  }

  _clearAllWords(){
    for(int i = 0; i < _reviewWords.length; i++){
      _listKey.currentState?.removeItem(0, (context, animation) =>
      WordTile(animation: animation, word: _reviewWords[i], index: i,));
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reviewWords.clear();
    });
  }
}

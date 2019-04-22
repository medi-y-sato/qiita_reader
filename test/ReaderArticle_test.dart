import 'package:test/test.dart';
import 'package:qiita_reader/ReaderArticle.dart';

import 'dart:convert';

// https://reader.com/yujikawa/items/fe509b160df5ab9eb74e

void main() {

  group("ReaderArticle",(){

    setUp((){
    });

    test('ReaderArticle instance', () {
      ReaderArticle readerArticle = ReaderArticle();
      expect(readerArticle, TypeMatcher<ReaderArticle>());
    });

    test("ReaderArticle loadArticles",(){
      ReaderArticle readerArticle = ReaderArticle();
      readerArticle.loadArticles();
      ReaderArticleList resultList = readerArticle.getArticleList();

      expect(resultList.getArticle(0).url,"https://reader.com/chenglin/items/e23b8303665042e53158");
      expect(resultList.getArticle(0).title,"MongoDBのGUI操作ツール");
      expect(resultList.getArticle(0).summary,"""MongoDBの操作にコマンドのほうが多いかもしれませんが、""");
      // TODO: コントロールコード (\nとか)が入るとjson Decodeが異常と判断するので、どうするか考える
    }
    );

  });

  group("ReaderArticleList",(){

    ReaderArticleList qitaArticleList;
    ReaderArticleData readerArticleData;

    setUp((){
      qitaArticleList = ReaderArticleList();

      readerArticleData = ReaderArticleData();

      readerArticleData.url = "url";
      readerArticleData.title = "title";
      readerArticleData.summary = "summary";
      qitaArticleList.push(readerArticleData);

      ReaderArticleData readerArticleData2 = ReaderArticleData();

      readerArticleData2.url = "url2";
      readerArticleData2.title = "title2";
      readerArticleData2.summary = "summary2";
      qitaArticleList.push(readerArticleData2);
    });

    test('init ReaderArticleList', () {
      ReaderArticleList readerArticleList = ReaderArticleList();
      expect(readerArticleList, TypeMatcher<ReaderArticleList>());
    });

    test('ReaderArticleList getArticle()', () {
      expect(qitaArticleList.getArticle(1).url, "url2");
      expect(qitaArticleList.getArticle(1).title, "title2");
      expect(qitaArticleList.getArticle(1).summary, "summary2");

      expect(qitaArticleList.getArticle(0).url, "url");
      expect(qitaArticleList.getArticle(0).title, "title");
      expect(qitaArticleList.getArticle(0).summary, "summary");
    });

  });

  group("ReaderArticleData",(){

    test('init ReaderArticleData', () {
      ReaderArticleList readerArticleList = ReaderArticleList();
      expect(readerArticleList, TypeMatcher<ReaderArticleList>());
    });


  });

}

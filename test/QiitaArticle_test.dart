import 'package:test/test.dart';
import 'package:qiita_reader/QiitaArticle.dart';

import 'dart:convert';

// https://qiita.com/yujikawa/items/fe509b160df5ab9eb74e

void main() {

  group("QiitaArticle",(){

    QiitaArticle qiitaArticle;
    QiitaArticleList resultList;

    setUp((){
      qiitaArticle = QiitaArticle();
      var apiData = """[{"rendered_body":"rendered_body","body":"MongoDBの操作にコマンドのほうが多いかもしれませんが、","coediting":false,"comments_count":0,"created_at":"2019-04-08T16:16:18+09:00","group":null,"id":"e23b8303665042e53158","likes_count":0,"private":false,"reactions_count":0,"tags":[{"name":"MongoDB","versions":[]},{"name":"GUI","versions":[]},{"name":"Robo3T","versions":[]},{"name":"NoSQLBooster","versions":[]},{"name":"Nosqlclient","versions":[]}],"title":"MongoDBのGUI操作ツール","updated_at":"2019-04-08T16:16:18+09:00","url":"https://qiita.com/chenglin/items/e23b8303665042e53158","user":{"description":null,"facebook_id":null,"followees_count":0,"followers_count":0,"github_login_name":null,"id":"chenglin","items_count":26,"linkedin_id":null,"location":null,"name":"","organization":null,"permanent_id":346425,"profile_image_url":"https://qiita-image-store.s3.amazonaws.com/0/346425/profile-images/1550925833","team_only":false,"twitter_screen_name":null,"website_url":null},"page_views_count":null},{"rendered_body":"rendered_body 略","body":"body 略","coediting":false,"comments_count":0,"created_at":"2019-04-08T16:16:09+09:00","group":null,"id":"d27a3e2b247fa43e39f9","likes_count":0,"private":false,"reactions_count":0,"tags":[{"name":"JavaScript","versions":[]},{"name":"Facebook","versions":[]},{"name":"Twitter","versions":[]},{"name":"シェア","versions":[]},{"name":"URLSearchParams","versions":[]}],"title":"JavaScriptでTwitter、Facebookシェア用URLを作る","updated_at":"2019-04-08T16:17:25+09:00","url":"https://qiita.com/SugarShootingStar/items/d27a3e2b247fa43e39f9","user":{"description":"Vue.js/Nuxt.js/Node.jsなどフロントエンドに関する仕事をしています　ググってもあんまり出てこない情報を中心に記事を書いています","facebook_id":"","followees_count":24,"followers_count":35,"github_login_name":"SugarShootingStar","id":"SugarShootingStar","items_count":39,"linkedin_id":"","location":"Tokyo","name":"しゅけ ピー","organization":"Yumemi.Inc","permanent_id":264910,"profile_image_url":"https://avatars3.githubusercontent.com/u/18649842?v=4","team_only":false,"twitter_screen_name":"_Ancient_Scapes","website_url":""},"page_views_count":null}]""";

      var parsedApiDataList = jsonDecode(apiData);
      resultList = qiitaArticle.apiData2ArticleList(parsedApiDataList);
    });

    test('QiitaArticle instance', () {
      QiitaArticle qiitaArticle = QiitaArticle();
      expect(qiitaArticle, TypeMatcher<QiitaArticle>());
    });

    test("QiitaArticle apiData to QiitaArticleData",(){

      expect(resultList.getArticle(0).url,"https://qiita.com/chenglin/items/e23b8303665042e53158");
      expect(resultList.getArticle(0).title,"MongoDBのGUI操作ツール");
      expect(resultList.getArticle(0).summary,"""MongoDBの操作にコマンドのほうが多いかもしれませんが、""");
      // TODO: コントロールコード (\nとか)が入るとjson Decodeが異常と判断するので、どうするか考える
    }
    );

  });

  group("QiitaArticleList",(){

    QiitaArticleList qitaArticleList;
    QiitaArticleData qiitaArticleData;

    setUp((){
      qitaArticleList = QiitaArticleList();

      qiitaArticleData = QiitaArticleData();

      qiitaArticleData.url = "url";
      qiitaArticleData.title = "title";
      qiitaArticleData.summary = "summary";
      qitaArticleList.push(qiitaArticleData);

      QiitaArticleData qiitaArticleData2 = QiitaArticleData();

      qiitaArticleData2.url = "url2";
      qiitaArticleData2.title = "title2";
      qiitaArticleData2.summary = "summary2";
      qitaArticleList.push(qiitaArticleData2);
    });

    test('init QiitaArticleList', () {
      QiitaArticleList qiitaArticleList = QiitaArticleList();
      expect(qiitaArticleList, TypeMatcher<QiitaArticleList>());
    });

    test('QiitaArticleList getArticle()', () {
      expect(qitaArticleList.getArticle(1).url, "url2");
      expect(qitaArticleList.getArticle(1).title, "title2");
      expect(qitaArticleList.getArticle(1).summary, "summary2");

      expect(qitaArticleList.getArticle(0).url, "url");
      expect(qitaArticleList.getArticle(0).title, "title");
      expect(qitaArticleList.getArticle(0).summary, "summary");
    });

  });

  group("QiitaArticleData",(){

    test('init QiitaArticleData', () {
      QiitaArticleList qiitaArticleList = QiitaArticleList();
      expect(qiitaArticleList, TypeMatcher<QiitaArticleList>());
    });


  });

}

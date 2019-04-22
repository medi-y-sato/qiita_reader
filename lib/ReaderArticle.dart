import 'dart:convert';

class ReaderArticleList {
  int length;
  List<ReaderArticleData> readerArticleList;
  ReaderArticleList({this.readerArticleList}) {
    this.readerArticleList = [];
  }

  push(ReaderArticleData data) {
    this.readerArticleList.add(data);
    this.length = this.readerArticleList.length;
  }

  getArticle(int articleNumber) {
    if (articleNumber != null && articleNumber < this.readerArticleList.length) {
      return this.readerArticleList[articleNumber];
    }
  }
}

class ReaderArticleData {
  String url;
  String title;
  String summary;

  ReaderArticleData({this.url, this.title, this.summary});

  toString(){
    return "url : " + this.url + "\ntitle : " + this.title + "\nsummary : " + this.summary;
  }

}

class ReaderArticle {
  ReaderArticleList readerArticleList;

  // readerのAPIからデータを読み込んできて格納する
  // https://reader.com//api/v2/items
  loadArticles() {
    // 仮
    // 本当は通信してAPIから取得したJSON文字列を使う
    String receivedApiData = """[{"rendered_body":"rendered_body","body":"MongoDBの操作にコマンドのほうが多いかもしれませんが、","coediting":false,"comments_count":0,"created_at":"2019-04-08T16:16:18+09:00","group":null,"id":"e23b8303665042e53158","likes_count":0,"private":false,"reactions_count":0,"tags":[{"name":"MongoDB","versions":[]},{"name":"GUI","versions":[]},{"name":"Robo3T","versions":[]},{"name":"NoSQLBooster","versions":[]},{"name":"Nosqlclient","versions":[]}],"title":"MongoDBのGUI操作ツール","updated_at":"2019-04-08T16:16:18+09:00","url":"https://reader.com/chenglin/items/e23b8303665042e53158","user":{"description":null,"facebook_id":null,"followees_count":0,"followers_count":0,"github_login_name":null,"id":"chenglin","items_count":26,"linkedin_id":null,"location":null,"name":"","organization":null,"permanent_id":346425,"profile_image_url":"https://reader-image-store.s3.amazonaws.com/0/346425/profile-images/1550925833","team_only":false,"twitter_screen_name":null,"website_url":null},"page_views_count":null},{"rendered_body":"rendered_body 略","body":"body 略","coediting":false,"comments_count":0,"created_at":"2019-04-08T16:16:09+09:00","group":null,"id":"d27a3e2b247fa43e39f9","likes_count":0,"private":false,"reactions_count":0,"tags":[{"name":"JavaScript","versions":[]},{"name":"Facebook","versions":[]},{"name":"Twitter","versions":[]},{"name":"シェア","versions":[]},{"name":"URLSearchParams","versions":[]}],"title":"JavaScriptでTwitter、Facebookシェア用URLを作る","updated_at":"2019-04-08T16:17:25+09:00","url":"https://reader.com/SugarShootingStar/items/d27a3e2b247fa43e39f9","user":{"description":"Vue.js/Nuxt.js/Node.jsなどフロントエンドに関する仕事をしています　ググってもあんまり出てこない情報を中心に記事を書いています","facebook_id":"","followees_count":24,"followers_count":35,"github_login_name":"SugarShootingStar","id":"SugarShootingStar","items_count":39,"linkedin_id":"","location":"Tokyo","name":"しゅけ ピー","organization":"Yumemi.Inc","permanent_id":264910,"profile_image_url":"https://avatars3.githubusercontent.com/u/18649842?v=4","team_only":false,"twitter_screen_name":"_Ancient_Scapes","website_url":""},"page_views_count":null}]""";

    // jsonDecodeでバラし、変換をかける
    var parsedApiData = jsonDecode(receivedApiData);

    ReaderArticleList resultList = new ReaderArticleList();
    parsedApiData.forEach((parsedApiData){

      ReaderArticleData parsedArticleData = ReaderArticleData();
      parsedArticleData.url = parsedApiData["url"];
      parsedArticleData.title = parsedApiData["title"];
      parsedArticleData.summary = parsedApiData["body"];

      resultList.push(parsedArticleData);
    });

    this.readerArticleList = resultList;
  }


  // 記事をリストで取得する
  getArticleList() {
    return this.readerArticleList;
  }

  // 記事を取得する
  getArticle(int articleNumber) {
    return this.readerArticleList.getArticle(articleNumber);
  }
}

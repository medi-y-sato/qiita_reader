import 'dart:convert';

class QiitaArticleList {
  int length;
  List<QiitaArticleData> qiitaArticleList;
  QiitaArticleList({this.qiitaArticleList}) {
    this.qiitaArticleList = [];
  }

  push(QiitaArticleData data) {
    this.qiitaArticleList.add(data);
    this.length = this.qiitaArticleList.length;
  }

  getArticle(int articleNumber) {
    if (articleNumber != null && articleNumber < this.qiitaArticleList.length) {
      return this.qiitaArticleList[articleNumber];
    }
  }
}

class QiitaArticleData {
  String url;
  String title;
  String summary;

  QiitaArticleData({this.url, this.title, this.summary});

  toString(){
    return "url : " + this.url + "\ntitle : " + this.title + "\nsummary : " + this.summary;
  }

}

class QiitaArticle {
  QiitaArticleList qiitaArticleList;

  // QiitaのAPIからデータを読み込んできて格納する
  // https://qiita.com//api/v2/items
  loadArticles() {
    // 仮
    // 本当は通信してAPIから取得したJSON文字列を使う
    String receivedApiData = """[{"rendered_body":"<p>MongoDBの操作にコマンドのほうが多いかもしれませんが、<br>\nやはりGUIのほうが直感的でよく使いますね。</p>\n\n<p>GUIツールはいくつかがありますが、使いやすさ、ラインセンスなどによって選択できます。</p>\n\n<h1>\n<span id=\"robo-3t\" class=\"fragment\"></span><a href=\"#robo-3t\"><i class=\"fa fa-link\"></i></a>Robo 3T</h1>\n\n<p>Robo 3T (formerly Robomongo) is the free lightweight GUI for MongoDB enthusiasts.<br>\nURL: <a href=\"https://robomongo.org/\" class=\"autolink\" rel=\"nofollow noopener\" target=\"_blank\">https://robomongo.org/</a></p>\n\n<p>Studio 3TはProfessional MongoDB GUIです。</p>\n\n<p>普段作業では、Robo 3Tでも十分できます。<br>\nイメージ：<br>\n<a href=\"https://camo.qiitausercontent.com/87ab30b6193bc4fd469cc0bf1d2e4cb7c0f4dca4/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3334363432352f33383838386363662d626139652d663535382d363238622d3061396636626664333732372e706e67\" target=\"_blank\" rel=\"nofollow noopener\"><img src=\"https://camo.qiitausercontent.com/87ab30b6193bc4fd469cc0bf1d2e4cb7c0f4dca4/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3334363432352f33383838386363662d626139652d663535382d363238622d3061396636626664333732372e706e67\" alt=\"image.png\" data-canonical-src=\"https://qiita-image-store.s3.amazonaws.com/0/346425/38888ccf-ba9e-f558-628b-0a9f6bfd3727.png\"></a></p>\n\n<h1>\n<span id=\"nosqlclient\" class=\"fragment\"></span><a href=\"#nosqlclient\"><i class=\"fa fa-link\"></i></a>Nosqlclient</h1>\n\n<p>Cross-platform and self hosted, easy to use, intuitive mongodb management tool - Formerly Mongoclient</p>\n\n<p>URL：<a href=\"https://www.nosqlclient.com\" class=\"autolink\" rel=\"nofollow noopener\" target=\"_blank\">https://www.nosqlclient.com</a></p>\n\n<p>Windows版のダウンロードは、<br>\n<a href=\"https://github.com/nosqlclient/nosqlclient\" class=\"autolink\" rel=\"nofollow noopener\" target=\"_blank\">https://github.com/nosqlclient/nosqlclient</a><br>\nページのDistributionsの「Windows x64」リンクとなります。</p>\n\n<p>イメージ：<br>\n<a href=\"https://camo.qiitausercontent.com/0a0eb9addcad730e54879c63e329df57e8b93a66/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3334363432352f32303435393264372d363366362d363232322d306633612d6561383632313734386665312e706e67\" target=\"_blank\" rel=\"nofollow noopener\"><img src=\"https://camo.qiitausercontent.com/0a0eb9addcad730e54879c63e329df57e8b93a66/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3334363432352f32303435393264372d363366362d363232322d306633612d6561383632313734386665312e706e67\" alt=\"image.png\" data-canonical-src=\"https://qiita-image-store.s3.amazonaws.com/0/346425/204592d7-63f6-6222-0f3a-ea8621748fe1.png\"></a></p>\n\n<h1>\n<span id=\"nosqlbooster\" class=\"fragment\"></span><a href=\"#nosqlbooster\"><i class=\"fa fa-link\"></i></a>NoSQLBooster</h1>\n\n<p>URL:<a href=\"https://nosqlbooster.com/home\" class=\"autolink\" rel=\"nofollow noopener\" target=\"_blank\">https://nosqlbooster.com/home</a><br>\n個人用はFreeです。</p>\n\n<p>など</p>\n\n<p>以上</p>\n","body":"MongoDBの操作にコマンドのほうが多いかもしれませんが、\nやはりGUIのほうが直感的でよく使いますね。\n\nGUIツールはいくつかがありますが、使いやすさ、ラインセンスなどによって選択できます。\n\n#Robo 3T\n\nRobo 3T (formerly Robomongo) is the free lightweight GUI for MongoDB enthusiasts.\nURL: https://robomongo.org/\n\nStudio 3TはProfessional MongoDB GUIです。\n\n普段作業では、Robo 3Tでも十分できます。\nイメージ：\n![image.png](https://qiita-image-store.s3.amazonaws.com/0/346425/38888ccf-ba9e-f558-628b-0a9f6bfd3727.png)\n\n\n#Nosqlclient\n\nCross-platform and self hosted, easy to use, intuitive mongodb management tool - Formerly Mongoclient\n\nURL：https://www.nosqlclient.com\n\nWindows版のダウンロードは、\nhttps://github.com/nosqlclient/nosqlclient\nページのDistributionsの「Windows x64」リンクとなります。\n\nイメージ：\n![image.png](https://qiita-image-store.s3.amazonaws.com/0/346425/204592d7-63f6-6222-0f3a-ea8621748fe1.png)\n\n\n#NoSQLBooster\nURL:https://nosqlbooster.com/home\n個人用はFreeです。\n\nなど\n\n以上\n","coediting":false,"comments_count":0,"created_at":"2019-04-08T16:16:18+09:00","group":null,"id":"e23b8303665042e53158","likes_count":0,"private":false,"reactions_count":0,"tags":[{"name":"MongoDB","versions":[]},{"name":"GUI","versions":[]},{"name":"Robo3T","versions":[]},{"name":"NoSQLBooster","versions":[]},{"name":"Nosqlclient","versions":[]}],"title":"MongoDBのGUI操作ツール","updated_at":"2019-04-08T16:16:18+09:00","url":"https://qiita.com/chenglin/items/e23b8303665042e53158","user":{"description":null,"facebook_id":null,"followees_count":0,"followers_count":0,"github_login_name":null,"id":"chenglin","items_count":26,"linkedin_id":null,"location":null,"name":"","organization":null,"permanent_id":346425,"profile_image_url":"https://qiita-image-store.s3.amazonaws.com/0/346425/profile-images/1550925833","team_only":false,"twitter_screen_name":null,"website_url":null},"page_views_count":null},{"rendered_body":"rendered_body 略","body":"body 略","coediting":false,"comments_count":0,"created_at":"2019-04-08T16:16:09+09:00","group":null,"id":"d27a3e2b247fa43e39f9","likes_count":0,"private":false,"reactions_count":0,"tags":[{"name":"JavaScript","versions":[]},{"name":"Facebook","versions":[]},{"name":"Twitter","versions":[]},{"name":"シェア","versions":[]},{"name":"URLSearchParams","versions":[]}],"title":"JavaScriptでTwitter、Facebookシェア用URLを作る","updated_at":"2019-04-08T16:17:25+09:00","url":"https://qiita.com/SugarShootingStar/items/d27a3e2b247fa43e39f9","user":{"description":"Vue.js/Nuxt.js/Node.jsなどフロントエンドに関する仕事をしています　ググってもあんまり出てこない情報を中心に記事を書いています","facebook_id":"","followees_count":24,"followers_count":35,"github_login_name":"SugarShootingStar","id":"SugarShootingStar","items_count":39,"linkedin_id":"","location":"Tokyo","name":"しゅけ ピー","organization":"Yumemi.Inc","permanent_id":264910,"profile_image_url":"https://avatars3.githubusercontent.com/u/18649842?v=4","team_only":false,"twitter_screen_name":"_Ancient_Scapes","website_url":""},"page_views_count":null}]""";

    // jsonDecodeでバラし、変換をかける
    var parsedApiData = jsonDecode(receivedApiData);
    this.qiitaArticleList = apiData2ArticleList(parsedApiData);
  }

  // 配列JSONを一件ごとにバラしてパーサに投げる
  apiData2ArticleList(parsedApiDataList){
    QiitaArticleList resultList = new QiitaArticleList();
    parsedApiDataList.forEach((parsedApiData){
      var result = apiData2ArticleData(parsedApiData);
      resultList.push(result);
    });
    return resultList;
  }

  // jsonのデータからフィールドを引き抜いて格納していくパーサ
  // フォーマットへの対応はココで行う
  apiData2ArticleData(apiData){
    QiitaArticleData parsedArticleData = QiitaArticleData();

    parsedArticleData.url = apiData["url"];
    parsedArticleData.title = apiData["title"];
    parsedArticleData.summary = apiData["body"];

    return parsedArticleData;
  }


  // 記事をリストで取得する
  getArticleList() {
    return this.qiitaArticleList;
  }

  // 記事を取得する
  getArticle(int articleNumber) {
    return this.qiitaArticleList.getArticle(articleNumber);
  }
}

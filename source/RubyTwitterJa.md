Ruby Twitter Gemでとりあえずログインしてツイートを取ってくるところまで解説します。

# インストール

    $ gem install twitter -v 5.16.0

(環境によっては sudo gem 〜)

以下の解説はtwitter gem 5.16.0で確認していますが、もっと新しいバージョンでも動くかもしれません。

# リンク

* 公式サイト：http://sferik.github.io/twitter/
* github：https://github.com/sferik/twitter
* リファレンス：http://www.rubydoc.info/gems/twitter/5.16.0

# 例

```
require 'twitter'
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "(1)"
  config.consumer_secret     = "(2)"
  config.access_token        = "(3)"
  config.access_token_secret = "(4)"
end
client.home_timeline.each do |tweet|
  # tweetはTwitter::Tweetクラスのオブジェクト
  p tweet.text
end
```

(1)(2)(3)(4)に入れる値は、アプリ登録で入手します。Twitter APIを使うためにはアプリ登録が必要です。

# アプリ登録

https://apps.twitter.com/ からアプリを登録します。

Keys and Access Tokensタブを開き、以下の値をコピペします。

* (1) ... "Application Settings"欄の"Consumer Key (API Key)"
* (2) ... "Application Settings"欄の"Consumer Secret (API Secret)"
* (3) ... "Your Access Token"欄の"Access Token"
* (4) ... "Your Access Token"欄の"Access Token Secret"

# 簡易リファレンス

## Twitter::Tweetクラス

- tweet.text ツイート本文(String) 
- tweet.user 発言者(Twitter::User)
- tweet.retweet_count RT数(Integer)
- tweet.favorite_count fav数(Integer)

https://github.com/sferik/twitter/blob/v5.16.0/lib/twitter/tweet.rb

## Twitter::Userクラス

- user.name ユーザ名(Srting)
- user.screen_name ユーザID(String)

https://github.com/sferik/twitter/blob/v5.16.0/lib/twitter/user.rb

## Twitter::Clientクラス

- client.home_timeline : メインのタイムライン

```
client.home_timeline.each do |tweet|
  p tweet.text
end
```

- client.mentions_timeline : メンション欄
- client.user_timeline("yukihiro_matz") : あるユーザの発言

https://github.com/sferik/twitter/blob/v5.16.0/lib/twitter/client.rb

# API制限について

Twitter APIは呼べる頻度に制限があり、短時間に何度もAPIを呼ぶとエラーが返ることがあります。2016年5月現在の[仕様](https://dev.twitter.com/rest/public/rate-limiting)では、15分待てばまた呼べるようになるようです。


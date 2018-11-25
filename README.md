# necoceb
A Twitter bot imitating me.

## Usage
正直よく覚えてないんですが、3-gram情報をてきとうなDBに入れて、
sample.envを参考にDB接続情報とTwitter API接続情報を書いてください。

あとは `bundle install` して、

```sh
$ bundle exec ruby ./sentence_composer.rb | bundle exec ruby ./tweeter.rb
```

とかでpostできます。

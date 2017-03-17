# Lit - 怪人メイド女
これはPOSIX shに準拠したシンプルで小さいWebサーバー怪人です。
きっと、あなたの望むファイルやディレクトリのリストを供給してくれるに違いありません。netcatとsocatで動作します。

なお、この怪人メイド女は不完全なサイボーグなので若干の欠陥を持っています。扱いには注意してください。そして改造手術を施し、怪人をさらに進化させてくれるご主人さまをお待ちしております。

POSIX原理主義はちょー楽しいので、その楽しさをわかってもらうために、怪人メイド女にはlitと名付けました。Git「間抜け」の命名例よりパクりました。Lit「ちょー楽しい」という意味です。サーバーの表記が怪人メイド女となっています。

## 特徴
- 静的ページのwebサーバーです。 
- POSIX原理主義
    - コピーしてくるだけで、いつでも、どこでも、すぐにお仕えできます。
    - 途中で壊れない、きっとあなたの完璧なメイドになりえます。
    - 'write onece, run anywhere, run for good'
- 拡張子が.shのシェルスクリプトを実行できます。つまり動的にページを生成するポテ>ンシャルを有しています。
- ディレクトリの場合にはディレクトリツリーを生成します。
    - directory.shを改変すれば好きな形にできます。
　　- 改造すれば、リダイレクトも簡単です（近日改造予定）。
- ログの収集も場合によっては可能ですが、改良の余地ありです。
- 設定ファイルはありません。
- 接続と動作の設定はオプションで行います
- 軽量なシングルファイルです。
- 写像的プログラミングに習っているので処理順を把握するのは楽だと思います（好みによります。個性の強い怪人です）
- 英語しか理解のできない、言語能力に難のある怪人です。今他の言語も学習中です。
- 隠しファイルは表示しません
- 親ディレクトリの参照はできません
- HTTP Error responses
    - 405 Method Not Allowed
    - 404 Not Found
    - 403 Forbidden
    - 400 Bad Request
    - 500 Internal Error

怪人メイド女は、上記のような基本的なことを実行可能です。これから対応予定の機能は以下の通りです。

1. Run service as unprivileged user
2. URL decoding (%XX)
3. Access and error logs with logger
4. Other METHOD(PUT, POST, DELETE, ...)
6. cookie


## Usage:

怪人メイド女は、ディレクトリで以下のコマンドを実行するだけで動作します。

```
$ ./lit -r 'REGEX' -p PORT_NUMBER -d ROOT_DIRECTORY
```
怪人メイド女は、-pオプションで、指定したポート番号"PORT_NUMBER"で接続を待ち受けます。ルートディレクトリは-dオプションで指定したディレクトリになります。

When URI matches your set REGEX, it will serve a directory 
or file matching the string of the request from DOC_ROOT_DIR.

## Recommended Example:
```
$ ./lit -r '/.*' -d /mnt/c/Users/username -p 8080
```
この例では、怪人メイド女は8080番ポートで動作します。ルートは"/mnt/c/Users/username"です
URI can match '/.*' BRE (Basic Regular Expression). 

In the above example, if the string requested by the 
user matches any character string including /, it will be served if there is a corresponding file or directory. The directory
list is displayed with a relative path link by HTML, so the 
user can easily access the desired directory and file.

If you not set `-p` or `--port` option, phttpd wait on port 
`1234` by default.

Without `-d` (or `--docroot`) option and 
`-r` (or `--regex`), PHTTPd's DOC_ROOT_DIR 
is ~ and REGEX is '/.*'. 

For your needs, set options you like.

## debug
you can use `-f` or `--filter` options for debugging.
Make phttpd act as a filter, not as a server. 
If you send a pseudo request you will get a response to that.

You can easily extend it with this option.

## Mapping programing and at a glance

Deciphering and expanding is easy, 
as this shell script is written to exactly 
match the procedure manual. This is the procedure 
manual itself. We are saying 
that this idea is mapping programming or at a glance.

## Requisites

* cat
* date
* file
* sed
* awk
* netcat
* socat
* mime-make(@shellschoccarjpn)

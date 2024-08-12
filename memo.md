glTF-Sample-Assets のサンプルを使用する
# まずは3Dモデルを変換するhookを作成する

ディレクトリのルートにhookを掘る  
hook/build.dartを用意して内容を書く  
hookを使用するために native_assets_cli を入れる
`flutter pub add native_assets_cli`

# CustomPaintにわたすCustomPainterのWidgetを作る
 
Flutterで3Dモデルを表示させるにはCustomPaint WidgetへCustomPainterクラスを渡す必要があるので
lib/scene_painter.dartを用意する

# Node.fromAssetでモデルをロード

initStateの中でNode.fromAssetでモデルをロードする
その際ファイルのパスはビルド後の.modelファイルにする


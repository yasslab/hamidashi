# language: ja

フィーチャ: hamidashiコマンドでPDFのはみ出しているページを調べることができる

  ReVIEWで本を書く著者として、
  hamidashiコマンドではみ出しているページを調べたい、
  なぜならはみ出してると読者が内容を読めず本の価値が100%届かないからだ。

  シナリオ: hamidashiコマンドでページがはみ出していないことを確認する
    もし   bundle exec hamidashi test/fixtures/no_hamidashi.pdfコマンドを実行する
    ならば コマンドの実行結果は以下の通りである
      """
      """
    かつ   コマンドの終了ステータスは0である

  シナリオ: hamidashiコマンドではみ出しているページの番号を調べる
    もし   bundle exec hamidashi test/fixtures/hamidashi.pdfコマンドを実行する
    ならば コマンドの実行結果は以下の通りである
      """
      1
      2
      """
    かつ   コマンドの終了ステータスは1である

  シナリオ: hamidashiコマンドで余白のサイズを指定して、はみ出しているページの番号を調べる
    もし   bundle exec hamidashi test/fixtures/hamidashi.pdf --margin=1コマンドを実行する
    ならば コマンドの実行結果は以下の通りである
      """
      1
      """
    かつ   コマンドの終了ステータスは1である

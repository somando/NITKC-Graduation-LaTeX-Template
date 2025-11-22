# プロジェクト構成

本プロジェクトは多数のファイルで構成されています。
プロジェクトに含まれるファイルの詳細は以下の通りです。

## 編集が必要なファイル

卒業論文の執筆において、通常編集が必要なファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`main.tex`](../main.tex) | 分割したファイルを結合し、単一のファイルで出力する | ファイルの追加 |
| [`details.tex`](../details.tex) | 本文ページ | 本文の記述 |
| [`acknowledgment.tex`](../acknowledgment.tex) | 謝辞[^acknowledgment]ページ | 謝辞の記述 |
| [`references.bib`](../references.bib) | 参考文献の管理 | 参考文献の追加 |
| [`settings.tex`](../settings.tex) | それぞれの要素の調整など設定事項 | タイトル及び著者の編集 |

[^acknowledgment]: 謝辞（ Acknowledgment ）: 研究や執筆に協力・支援してくれた人や組織への感謝を書く節。

## LaTeX 設定ファイル

LaTeXの設定や構成を管理するファイルです。通常は編集不要です。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`package.sty`[^sty]](../package.sty) | 使用するパッケージ[^package]を指定 | 基本なし |
| [`contents.tex`](../contents.tex) | 目次ページ | 基本なし |
| [`references.tex`](../references.tex) | 参考文献ページ | 基本なし |
| [`bibstyle.bbx`[^bbx]](../bibstyle.bbx) | BiBLaTeX[^biblatex] における調整 | 基本なし |

[^sty]: .sty （スタイルファイル）: LaTeX の見た目や機能を追加・変更する設定ファイル。文書全体の体裁や使用パッケージの読み込みに使う。

[^package]: LaTeX パッケージ: LaTeX に追加機能（図表、数式強化、レイアウト調整など）を提供する拡張部品。必要に応じて読み込んで使う。

[^bbx]: .bbx : BibLaTeX が参考文献の表示形式を決めるためのスタイル定義ファイル。

[^biblatex]: BibLaTeX （ビブラテフ）: LaTeX で参考文献を管理・整形するための仕組み。 BibTeX より柔軟に文献スタイルを制御できる。

## ビルド・出力関連

ローカル環境でのビルドや出力に関連するファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`outputs/`](../outputs/) | PDF ファイルの出力先 | ローカル実行時に自動編集 |
| [`.latexmkrc`](../.latexmkrc) | latexmk[^latexmx] の設定ファイル（ pLaTeX[^platex]、 BibTeX[^bibtex] 、Biber[^biber] などの設定） | 基本なし |
| [`local.Dockerfile`](../local.Dockerfile) | ローカル環境における Dockerfile[^dockerfile] | 基本なし |
| [`docker-compose.yml`](../docker-compose.yml) | ローカル環境における Docker Compose[^docker-compose] | 基本なし |
| [`entrypoint.sh`[^sh]](../entrypoint.sh) | Docker 環境にて実行する Entrypoint[^entrypoint] 処理を記述 | 基本なし |

[^latexmx]: latexmk : LaTeX のビルドを自動化する補助ツール。必要な回数のコンパイルや参考文献処理をまとめて実行してくれる。

[^platex]: pLaTeX : 日本語文書向けの LaTeX エンジンの一種。

[^bibtex]: BibTeX : .bib を読み取り、参考文献リストを生成するツール。

[^biber]: Biber : BibLaTeX 用の参考文献生成ツール。 BibTeX の後継的な位置づけで、より高機能。

[^dockerfile]: Dockerfile : Docker イメージ（実行環境の設計図）を作るための設定ファイル。

[^docker-compose]: docker compose （旧 docker-compose ）: 複数の Docker コンテナ設定をまとめて管理し、一括で起動する仕組み。

[^sh]: .sh （シェルスクリプト）: Linux / macOS のシェルで実行するコマンド列を書いたファイル。自動処理に使う。

[^entrypoint]: entrypoint : コンテナ起動時に最初に実行されるコマンド / スクリプト。

## 生成ファイル（ビルド時に自動生成）

LaTeX のビルド時に自動生成されるファイルです。 `.gitignore` で Git 管理から除外されています。通常は編集不要で、ビルド時に自動的に生成・更新されます。

| ファイル拡張子 | 概要 |
| --- | --- |
| `.aux` | 相互参照（図番号・式番号・引用番号など）に必要な情報を記録する補助ファイル |
| `.log` | ビルド時のログファイル |
| `.bbl` | 生成された参考文献リスト本体 |
| `.bcf` | Biber が文献処理を行うための制御ファイル |
| `.blg` | BibTeX / Biber のログファイル |
| `.dvi` | LaTeX が一旦出力する中間形式であり、 PDF に変換する前段のファイル |
| `.toc` | 目次ファイル |
| `.fdb_latexmk` | latexmk がビルド状況や参照ファイル一覧を管理するためのファイル |
| `.fls` | latexmk がビルド状況や参照ファイル一覧を管理するためのファイル |
| `.run.xml` | Biber が文献処理を行うための実行ファイル |

## CI[^ci] / CD[^cd] 設定

[^ci]: CI （継続的インテグレーション）: 更新のたびに自動でビルドやテストを走らせて品質を保つ仕組み。

[^cd]: CD （継続的デリバリー / デプロイ）: CI の結果を使って成果物を自動配布・公開する仕組み。

リモートリポジトリでの自動ビルド設定ファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`.gitlab-ci.yml`](../.gitlab-ci.yml) | GitLab CI を構成するスクリプト | 基本なし |
| [`.github/workflows/latex.yml`](../.github/workflows/latex.yml) | GitHub Actions を構成するスクリプト | 基本なし |
| [`.github/workflows/sync-repositories.yml`](../.github/workflows/sync-repositories.yml) | GitHub Actions で他のリポジトリに同期するスクリプト | フォーク先では不要なため削除（無駄な同期・ CI 実行を防ぐ） |

## ドキュメント

プロジェクトの使い方やセットアップ方法を説明するドキュメントです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`README.md`[^readme]](../README.md) | プロジェクトの概要とクイックスタート | 基本なし |
| [`docs/PROJECT_STRUCTURE.md`](PROJECT_STRUCTURE.md) | プロジェクト構成の詳細（本ドキュメント） | 基本なし |
| [`docs/GITHUB_SETUP.md`](GITHUB_SETUP.md) | GitHub でのセットアップ手順 | 基本なし |

[^readme]: README : リポジトリの概要、使い方、注意点などを最初に説明する案内文書。

## エディタ・Git設定

エディタやGitの設定ファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`.gitignore`](../.gitignore) | Git 管理の対象外ファイルの指定（ LaTeX のビルドファイルや出力 PDF など） | 基本なし |
| [`.editorconfig`[^editorconfig]](../.editorconfig) | エディタ設定 | 基本なし |
| [`.vscode/extensions.json`](../.vscode/extensions.json) | このプロジェクトの推奨拡張機能[^recommend-extension] | 基本なし |
| [`.vscode/settings.json`](../.vscode/settings.json) | 自動コンパイルの設定 | 基本なし |

[^editorconfig]: EditorConfig : エディタ間でインデントや改行コードなどの書式ルールを統一するための仕組み。

[^recommend-extension]: 推奨拡張機能: 作業を円滑にするため、プロジェクト側が利用者に入れてほしいと示しているエディタ拡張。

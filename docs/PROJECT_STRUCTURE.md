# プロジェクト構成

本プロジェクトは多数のファイルで構成されています。
プロジェクトに含まれるファイルの詳細は以下の通りです。

## 編集が必要なファイル

卒業論文の執筆において、通常編集が必要なファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`main.tex`](../main.tex) | 分割したファイルを結合し、単一のファイルで出力する | ファイルの追加 |
| [`details.tex`](../details.tex) | 本文ページ | 本文の記述 |
| [`acknowledgment.tex`](../acknowledgment.tex) | 謝辞ページ | 謝辞の記述 |
| [`references.bib`](../references.bib) | 参考文献の管理 | 参考文献の追加 |
| [`settings.tex`](../settings.tex) | それぞれの要素の調整など設定事項 | タイトル及び著者の編集 |

## LaTeX設定ファイル

LaTeXの設定や構成を管理するファイルです。通常は編集不要です。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`package.sty`](../package.sty) | 使用するパッケージを指定 | 基本なし |
| [`contents.tex`](../contents.tex) | 目次ページ | 基本なし |
| [`references.tex`](../references.tex) | 参考文献ページ | 基本なし |
| [`bibstyle.bbx`](../bibstyle.bbx) | BiBLaTeXにおける調整 | 基本なし |

## ビルド・出力関連

ローカル環境でのビルドや出力に関連するファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`outputs/`](../outputs/) | PDFファイルの出力先 | ローカル実行時に自動編集 |
| [`.latexmkrc`](../.latexmkrc) | latexmkの設定ファイル（platex、bibtex、biberなどの設定） | 基本なし |
| [`local.Dockerfile`](../local.Dockerfile) | ローカル環境におけるDockerイメージを構成する | 基本なし |
| [`docker-compose.yml`](../docker-compose.yml) | ローカル環境におけるDockerコンテナを構成する | 基本なし |
| [`entrypoint.sh`](../entrypoint.sh) | Docker環境にて実行する処理を記述 | 基本なし |

## 生成ファイル（ビルド時に自動生成）

LaTeXのビルド時に自動生成されるファイルです。`.gitignore`でGit管理から除外されています。通常は編集不要で、ビルド時に自動的に生成・更新されます。

| ファイル拡張子 | 概要 |
| --- | --- |
| `.aux` | LaTeXの補助ファイル（相互参照情報など） |
| `.log` | ビルド時のログファイル |
| `.bbl` | 参考文献リスト（bibtex/biberで生成） |
| `.bcf` | Biber制御ファイル |
| `.blg` | BibTeX/Biberのログファイル |
| `.dvi` | Device Independent形式の中間ファイル |
| `.toc` | 目次ファイル |
| `.fdb_latexmk` | latexmkのデータベースファイル |
| `.fls` | latexmkのファイルリスト |
| `.run.xml` | Biberの実行ファイル |

## CI/CD設定

リモートリポジトリでの自動ビルド設定ファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`.gitlab-ci.yml`](../.gitlab-ci.yml) | GitLab CIを構成するスクリプト | 基本なし |
| [`.github/workflows/latex.yml`](../.github/workflows/latex.yml) | GitHub Actionsを構成するスクリプト | 基本なし |
| [`.github/workflows/sync-repositories.yml`](../.github/workflows/sync-repositories.yml) | GitHub Actionsで他のリポジトリに同期するスクリプト | フォーク先では不要なため削除（無駄な同期・CI実行を防ぐ） |

## ドキュメント

プロジェクトの使い方やセットアップ方法を説明するドキュメントです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`README.md`](../README.md) | プロジェクトの概要とクイックスタート | 基本なし |
| [`docs/PROJECT_STRUCTURE.md`](PROJECT_STRUCTURE.md) | プロジェクト構成の詳細（本ドキュメント） | 基本なし |
| [`docs/GITHUB_SETUP.md`](GITHUB_SETUP.md) | GitHubでのセットアップ手順 | 基本なし |

## エディタ・Git設定

エディタやGitの設定ファイルです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`.gitignore`](../.gitignore) | Git管理の対象外ファイルの指定（LaTeXのビルドファイルや出力PDFなど） | 基本なし |
| [`.editorconfig`](../.editorconfig) | エディタ設定 | 基本なし |
| [`.vscode/extensions.json`](../.vscode/extensions.json) | このプロジェクトの推奨拡張機能 | 基本なし |
| [`.vscode/settings.json`](../.vscode/settings.json) | 自動コンパイルの設定 | 基本なし |

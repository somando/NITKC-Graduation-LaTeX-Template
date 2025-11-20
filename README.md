# Graduation LaTeX Template

本プロジェクトは香川高等専門学校 情報工学科における、卒業研究予稿をLaTeXで記述するテンプレートです。
プロジェクトをフォークすることでこのテンプレートを使用して卒業研究予稿を記述することができます。

> [!WARNING]
> 卒業研究予稿のリポジトリにおける、プロジェクトの公開設定をはじめとした権限設定は十分お気をつけ下さい。

## プロジェクト構成

本プロジェクトは多数のファイルで構成されており、それぞれの役割は以下のとおりです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`main.tex`](main.tex) | 分割したファイルを結合し、単一のファイルで出力する | ファイルの追加 |
| [`package.sty`](package.sty) | 使用するパッケージを指定 | 基本なし |
| [`contents.tex`](contents.tex) | 目次ページ | 基本なし |
| [`details.tex`](details.tex) | 本文ページ | 本文の記述 |
| [`acknowledgment.tex`](acknowledgment.tex) | 謝辞ページ | 謝辞の記述 |
| [`references.tex`](references.tex) | 参考文献ページ | 基本なし |
| [`references.bib`](references.bib) | 参考文献の管理 | 参考文献の追加 |
| [`settings.tex`](settings.tex) | それぞれの要素の調整など設定事項 | タイトル及び著者の編集 |
| [`bibstyle.bbx`](bibstyle.bbx) | BiBLaTeXにおける調整 | 基本なし |
| [`outputs/`](outputs/) | PDFファイルの出力先 | ローカル実行時に自動編集 |
| [`.gitignore`](.gitignore) | Git管理の対象外ファイルの指定 | 基本なし |
| [`local.Dockerfile`](local.Dockerfile) | ローカル環境におけるDockerイメージを構成する | 基本なし |
| [`docker-compose.yml`](docker-compose.yml) | ローカル環境におけるDockerコンテナを構成する | 基本なし |
| [`entrypoint.sh`](entrypoint.sh) | Docker環境にて実行する処理を記述 | 基本なし |
| [`.gitlab-ci.yml`](.gitlab-ci.yml) | GitLab CIを構成するスクリプト | 基本なし |
| [`.github/workflows/latex.yml`](.github/workflows/latex.yml) | GitHub Actionsを構成するスクリプト | 基本なし |
| [`.editorconfig`](.editorconfig) | エディタ設定 | 基本なし |
| [`.vscode/extensions.json`](.vscode/extensions.json) | このプロジェクトの推奨拡張機能 | 基本なし |
| [`.vscode/settings.json`](.vscode/settings.json) | 自動コンパイルの設定 | 基本なし |

## 使い方

本リポジトリの使用時は以下の拡張機能をインストールすることを推奨します。

- [Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave&ssr=false#review-details)
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)

### ローカル環境

以下の手順で実行するには、Docker環境がセットアップされている必要があります。

Dockerを使用せず、LaTeXの実行環境でコンパイルすることも可能です。

#### Docker環境でLaTeXファイルビルド

以下のコマンドを実行して、`main.tex`ファイルをコンパイルします。

コンパイルしたアーティファクトは`outputs`ディレクトリに出力されます。

``` bash
docker compose up
```

初回実行時にはイメージのビルドを行うため、数分ほど時間がかかります。

[Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave&ssr=false#review-details) がインストールされている場合、保存時に自動でコンパイルが行われます。

### リモート環境

本プロジェクトでは、GitHub ActionsとGitLab CI双方のCIスクリプトを用意しています。

使用しているリモート環境に応じて使用してください。

アーティファクトとしてファイルを使用できます。

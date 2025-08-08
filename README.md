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
| [`settings.tex`](settings.tex) | それぞれの要素の調整など設定事項 | 基本なし |
| [`bibstyle.bbx`](bibstyle.bbx) | BiBLaTeXにおける調整 | 基本なし |
| [`outputs/`](outputs/) | PDFファイルの出力先 | ローカル実行時に自動編集 |
| [`.gitignore`](.gitignore) | Git管理の対象外ファイルの指定 | 基本なし |
| [`local.Dockerfile`](local.Dockerfile) | ローカル環境におけるDockerイメージを構成する | 基本なし |
| [`docker-compose.yml`](docker-compose.yml) | ローカル環境におけるDockerコンテナを構成する | 基本なし |
| [`entrypoint.sh`](entrypoint.sh) | Docker環境にて実行する処理を記述 | 基本なし |
| [`.texignore`](.texignore) | 自動コンパイル対象外ファイルの指定 | 基本なし |
| [`.gitlab-ci.yml`](.gitlab-ci.yml) | GitLab CIを構成するスクリプト | 基本なし |
| [`.github/workflows/latex.yml`](.github/workflows/latex.yml) | GitHub Actionsを構成するスクリプト | 基本なし |

## 使い方

### ローカル環境

以下の手順で実行するには、Docker環境がセットアップされている必要があります。

#### 1. (Windows(WSLを除く)のみ)Gitでの改行コードの変換を無効化する

`entrypoint.sh`の改行コードがCRLFになっている場合、ENTRYPOINT処理が動作しません。

以下のコマンドを実行して、改行コードの変換を無効化します。

``` powershell
git config --global core.autocrlf false
```

#### 2. `entrypoint.sh`に実行権限を付与する

以下のコマンドを実行して、実行権限を付与します。

##### Mac / Linux(WSLを含む)の場合

``` bash
chmod +x entrypoint.sh
```

この操作はプロジェクトセットアップ時にのみ必要です。

#### 3. Docker環境でLaTeXファイルをビルドする

以下のコマンドを実行して、`main.tex`ファイルをコンパイルします。

コンパイルしたアーティファクトは`outputs`ディレクトリに出力されます。

``` bash
docker compose up
```

Dockerを使用せず、LaTeXの実行環境でコンパイルすることも可能です。

### リモート環境

本プロジェクトでは、GitHub ActionsとGitLab CI双方のCIスクリプトを用意しています。

使用しているリモート環境に応じて使用してください。

アーティファクトとしてファイルを使用できます。

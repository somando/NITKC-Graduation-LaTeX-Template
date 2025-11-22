# NITKC Graduation LaTeX Template

本プロジェクトは香川高等専門学校 情報工学科における、卒業論文をLaTeXで記述するテンプレートです。
プロジェクトをフォークすることでこのテンプレートを使用して卒業論文を記述することができます。

> [!WARNING]
> 卒業研究予稿のリポジトリにおける公開設定・権限設定に十分注意してください。

## クイックスタート

クイックスタートでは、以下の条件でプロジェクト利用を開始する手順を解説します。  
GitHubを使用した方法は [docs/GITHUB_SETUP.md](docs/GITHUB_SETUP.md) をご覧ください。

### 条件

- GitLab.com のアカウント作成済み
- SSH キーを GitLab.com に追加済み
- 既にローカル環境において、 Git をインストール済み
- (Dockerを使用してコンパイルを行う場合) 既にローカル環境において、 Docker をインストール済み

### 手順

1. [GitLab.com 上のテンプレートプロジェクト](https://gitlab.com/somando/nitkc-graduation-latex-template) にアクセスする
2. 画面右上の「フォーク」ボタンを選択し、各項目を編集する

   | 項目名 | 用途 | 推奨値 |
   | --- | --- | --- |
   | プロジェクト名 | GitLab上のプロジェクト名 | 特になし |
   | プロジェクトのURL | GitLab上でのネームスペース選択 | 自分のユーザーID |
   | プロジェクトslug | ネームスペース内に作成するID（ネームスペース内で一意） / クローン時のディレクトリ名 | 特になし |
   | プロジェクトの説明 | プロジェクトの説明（日本語可） | 特になし |
   | 含めるブランチ | フォーク先に含めるブランチ | どちらでも可 |
   | 表示レベル | プロジェクトの公開設定 | **非公開** |

3. 項目編集後に「プロジェクトをフォーク」ボタンをクリック
4. プロジェクトフォーク後、リダイレクトを待つ
5. 青色で表示されている「コード」をクリックし、 SSH でクローンの下に表示される `git@gitlab.com:<namespace>/<project_slug>.git` をコピーする
6. ローカル環境でプロジェクトを作成したいディレクトリをターミナルで開き、以下のコマンドを実行する

   ``` bash
   git clone <コピーしたSSHリモートURL (git@gitlab.com:<namespace>/<project_slug>.git)>
   cd <project_slug>
   ```

7. (Dockerを使用してコンパイルを行う場合) LaTeX編集後に以下のコマンドを実行することで、 `outputs/main.pdf` が生成される

   ``` bash
   docker compose up
   ```

   初回実行時には Docker イメージのビルドを行うため、数分ほど時間がかかります。

## リポジトリ配置

本プロジェクトは同一内容のリポジトリを **GitHub / GitLab.com / GitLab Self-Managed** の3箇所でホスティングしています。

| サービス | 推奨用途 |
| --- | --- |
| [GitLab.com](https://gitlab.com/somando/nitkc-graduation-latex-template) | **フォーク作成（作業用）** |
| [GitHub](https://github.com/somando/NITKC-Graduation-LaTeX-Template) | **テンプレートからリポジトリ作成（作業用）・PRの作成・Issueの追加／閲覧** |

> [!TIP]
> 学内/管理者運用のために GitLab Self-Managed にも同一内容をホスティングしています。
> GitLab Self-Managed の URL は管理者へお問い合わせください。  
> フォークして作業する場合は GitLab.com / GitLab Self-Managed からのフォークを推奨します。

## プロジェクト構成

本プロジェクトは多数のファイルで構成されています。  
全てのファイルにおける詳細は [docs/PROJECT_STRUCTURE.md](docs/PROJECT_STRUCTURE.md) を確認してください。

### 編集が必要なファイル

編集が必要なファイルは以下のとおりです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`main.tex`](main.tex) | 分割したファイルを結合し、単一のファイルで出力する | ファイルの追加 |
| [`details.tex`](details.tex) | 本文ページ | 本文の記述 |
| [`acknowledgment.tex`](acknowledgment.tex) | 謝辞ページ | 謝辞の記述 |
| [`references.bib`](references.bib) | 参考文献の管理 | 参考文献の追加 |
| [`settings.tex`](settings.tex) | それぞれの要素の調整など設定事項 | タイトル及び著者の編集 |
| [`.github/workflows/sync-repositories.yml`](.github/workflows/sync-repositories.yml) | GitHub Actionsで他のリポジトリに同期するスクリプト | フォーク先では不要なため削除（無駄な同期・CI実行を防ぐ） |

## セットアップ方法

### GitLabを使用する場合（推奨）

GitLabで管理する場合、プロジェクトからフォークをすることが可能です。  
表示レベルを非公開にし、プロジェクトをフォークしてください。

詳細は [クイックスタート](#クイックスタート) を参照してください。

#### テンプレート更新時に変更を取り込む

テンプレート更新時は「フォークを更新」ボタンより、変更の取り込みが可能です。  
更新後はローカル環境で `git pull origin main` 等、pull処理を行ってください。

コンフリクト発生時などはローカルで修正を行う必要がある可能性があります。

### GitHubを使用する場合

GitHubで管理したい場合は、[docs/GITHUB_SETUP.md](docs/GITHUB_SETUP.md) を参考にリポジトリを作成してください。

また、GitHubを使用する場合は、GitHub Actionsの不必要な実行を避けるため、フォーク後、 `.github/workflows/sync-repositories.yml` を削除する必要があります。

### リモートリポジトリが不要な場合

> [!TIP]
> リモートリポジトリを使用することでテンプレートの書式等変更があった場合に、簡単に更新が可能です。  
> リモートリポジトリを使用することを推奨いたします。

リモートリポジトリが不要な場合は以下のリンクよりローカルへのダウンロードが可能です。  
GitLab.comからダウンロード
[zip](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.zip?ref_type=heads),
[tar.gz](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.tar.gz?ref_type=heads),
[tar.bz2](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.tar.bz2?ref_type=heads),
[tar](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.tar?ref_type=heads)  
GitHubからダウンロード
[zip](https://github.com/somando/NITKC-Graduation-LaTeX-Template/archive/refs/heads/main.zip)

## コンパイル方法

本リポジトリの使用時は以下の拡張機能をインストールすることを推奨します。

- [Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave&ssr=false#review-details)
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)

### ローカル環境

以下の手順で実行するには、ローカル環境にDocker環境がセットアップされている必要があります。  
Dockerを使用せず、LaTeXの実行環境でコンパイルすることも可能です。

#### Docker環境でLaTeXファイルビルド

以下のコマンドを実行して、`main.tex`ファイルをコンパイルします。  
コンパイルしたアーティファクトは`outputs`ディレクトリに出力されます。

``` bash
docker compose up
```

初回実行時にはイメージのビルドを行うため、数分ほど時間がかかります。  
[Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave&ssr=false#review-details) がインストールされている場合、ファイル保存時に自動でコンパイルが行われます。

### リモート環境

本プロジェクトでは、GitHub ActionsとGitLab CI双方のCIスクリプトを用意しています。
使用しているリモート環境に応じて使用してください。  
アーティファクトとしてPDFファイルが出力されます。

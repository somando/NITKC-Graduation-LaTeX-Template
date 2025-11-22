# NITKC Graduation LaTeX Template

本プロジェクトは香川高等専門学校 情報工学科における、卒業論文を LaTeX[^latex] で記述するテンプレートです。  
プロジェクトをフォーク[^fork]することでこのテンプレートを使用して卒業論文を記述することができます。

[^latex]: LaTeX （ラテフ）: 論文や学術文書をきれいに組版するための文書作成システム。文章を「見た目」ではなく「構造（章・節・図表・参考文献など）」として記述し、 PDF などに変換して出力する。

[^fork]: フォーク（ fork ）: 他人のリポジトリを、自分のアカウント側にコピーして「自分用の独立した作業場所」として扱うこと。元のリポジトリに影響せず編集できる。

> [!WARNING]
> 卒業研究予稿のリポジトリにおける公開設定・権限設定に十分注意してください。  
> GitLab/GitHubのリポジトリを「公開」にすると、卒論内容や個人情報が外部に流出する可能性があります。必ず「非公開（Private）」で作成してください。

## クイックスタート

クイックスタートでは、以下の条件でプロジェクト利用を開始する手順を解説します。  
GitHub[^github] を使用した方法は [GITHUB_SETUP.md](docs/GITHUB_SETUP.md) をご覧ください。

[^github]: Git を使ったリモートリポジトリのホスティングサービス。公開 / 共有、レビュー、 Issue 管理などの機能が豊富で、開発や文書管理によく使われる。

### 条件

- GitLab.com[^gitlab-com] のアカウント作成済み
- SSH キー[^ssh_key]を GitLab.com に追加済み
- 既にローカル環境において、 Git[^git] をインストール済み
- ( Docker[^docker] を使用してコンパイルを行う場合) 既にローカル環境において、 Docker をインストール済み

[^gitlab-com]: GitLab.com: Git という仕組みでソースコードや文書を管理できるオンラインサービス。プロジェクトを置く場所（リモートリポジトリ）を提供し、共同編集や履歴管理ができる。

[^ssh_key]: SSH キー: パスワードの代わりにサーバへ安全にログイン / 通信するための「公開鍵」と「秘密鍵」のペア。 GitLab や GitHub に登録すると、認証を簡単・安全に行える。

[^git]: Git : ファイルの変更履歴を記録し、過去に戻したり差分を比較したりできる分散型バージョン管理システム。複数人作業でも変更が衝突しにくい。

[^docker]: Docker : アプリやツールの実行環境を「コンテナ」としてまとめ、同じ手順でどの PC でも動かせる仕組み。環境差によるトラブルを減らせる。

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
5. 青色で表示されている「コード」をクリックし、 SSH でクローン[^clone]の下に表示される `git@gitlab.com:<namespace>/<project_slug>.git` をコピーする
6. ローカル環境でプロジェクトを作成したいディレクトリをターミナルで開き、以下のコマンドを実行する

   ``` bash
   git clone <コピーしたSSHリモートURL (git@gitlab.com:<namespace>/<project_slug>.git)>
   cd <project_slug>
   ```

7. ( Docker を使用してコンパイルを行う場合) LaTeX 編集後に以下のコマンドを実行することで、 `outputs/main.pdf` が生成される

   ``` bash
   docker compose up
   ```

   初回実行時には Docker イメージのビルドを行うため、数分ほど時間がかかります。

[^clone]: クローン（ clone ）: リモートリポジトリの内容を、自分のPCへまるごとコピーして作業できるようにすること。

## リポジトリ配置

本プロジェクトは同一内容のリポジトリ[^repository]を **GitHub / GitLab.com / GitLab Self-Managed[^gitlab-self-managed]** の3箇所でホスティングしています。

[^repository]: リポジトリ（ repository ）: ファイルとその変更履歴をまとめて管理する保存場所。 Git では変更の記録や共有の単位になる。

[^gitlab-self-managed]: GitLab Self-Managed : 組織や学校が自分たちのサーバで運用する GitLab 。SaaS版より管理者が設定を自由に制御でき、学内専用などの用途に向く。

| サービス | 推奨用途 |
| --- | --- |
| [GitLab.com](https://gitlab.com/somando/nitkc-graduation-latex-template) | **フォーク作成（作業用）** |
| [GitHub](https://github.com/somando/NITKC-Graduation-LaTeX-Template) | **テンプレートからリポジトリ作成（作業用）・PRの作成・Issueの追加 / 閲覧** |

> [!TIP]
> 学内/管理者運用のために GitLab Self-Managed にも同一内容をホスティングしています。
> GitLab Self-Managed の URL は管理者へお問い合わせください。  
> フォークして作業する場合は GitLab.com / GitLab Self-Managed からのフォークを推奨します。

## プロジェクト構成

本プロジェクトは多数のファイルで構成されています。  
全てのファイルにおける詳細は [PROJECT_STRUCTURE.md](docs/PROJECT_STRUCTURE.md) を確認してください。

### 編集が必要なファイル

編集が必要なファイルは以下のとおりです。

| ファイル名 | 概要 | 編集タイミング |
| --- | --- | --- |
| [`main.tex`[^tex]](main.tex) | 分割したファイルを結合し、単一のファイルで出力する | ファイルの追加 |
| [`details.tex`](details.tex) | 本文ページ | 本文の記述 |
| [`acknowledgment.tex`](acknowledgment.tex) | 謝辞ページ | 謝辞の記述 |
| [`references.bib`[^bib]](references.bib) | 参考文献の管理 | 参考文献の追加 |
| [`settings.tex`](settings.tex) | それぞれの要素の調整など設定事項 | タイトル及び著者の編集 |
| [`.github/workflows/sync-repositories.yml`](.github/workflows/sync-repositories.yml) | GitHub Actions[^github-actions]で他のリポジトリに同期するスクリプト | フォーク先では不要なため削除（無駄な同期・ CI[^ci] 実行を防ぐ） |

[^tex]: .tex : LaTeX の本文や設定を書くためのテキストファイル形式。

[^bib]: .bib : 文献情報を BibTeX 形式で管理するファイル。LaTeX から参照して参考文献リストを自動生成できる。

[^github-actions]: GitHub Actions : GitHub 上で動く自動化機能。ビルド、テスト、 PDF 生成、同期作業などをリポジトリ更新に合わせて自動実行できる。

[^ci]: CI （ Continuous Integration  / 継続的インテグレーション）: リポジトリに変更が入るたびに、ビルドやテストなどを自動実行して、品質を保つ仕組み。

## セットアップ方法

### GitLab を使用する場合（推奨）

GitLab で管理する場合、プロジェクトからフォークをすることが可能です。  
表示レベルを非公開にし、プロジェクトをフォークしてください。

詳細は [クイックスタート](#クイックスタート) を参照してください。

#### テンプレート更新時に変更を取り込む

テンプレート更新時は「フォークを更新」ボタンより、変更の取り込みが可能です。  
更新後はローカル環境で `git pull origin main` 等、 pull[^pull] 処理を行ってください。

[^pull]: pull : リモートリポジトリの最新変更を自分の PC に取り込む操作。

コンフリクト[^conflict]発生時などはローカルで修正を行う必要がある可能性があります。

[^conflict]: コンフリクト（ conflict ）: 複数の変更が同じ箇所に入り、 Git が自動で統合できない状態。手動でどちらの内容を残すか選んで解決する必要がある。

### GitHub を使用する場合

GitHub で管理したい場合は、[GITHUB_SETUP.md](docs/GITHUB_SETUP.md) を参考にリポジトリを作成してください。

また、 GitHub を使用する場合は、 GitHub Actions の不必要な実行を避けるため、フォーク後、 `.github/workflows/sync-repositories.yml` を削除する必要があります。

### リモートリポジトリが不要な場合

> [!TIP]
> リモートリポジトリを使用することでテンプレートの書式等変更があった場合に、簡単に更新が可能です。  
> リモートリポジトリを使用することを推奨いたします。

リモートリポジトリが不要な場合、アカウント登録は不要です。

以下のリンクより、ダウンロードが可能です。  
GitLab.com からダウンロード
[zip](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.zip?ref_type=heads),
[tar.gz](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.tar.gz?ref_type=heads),
[tar.bz2](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.tar.bz2?ref_type=heads),
[tar](https://gitlab.com/somando/nitkc-graduation-latex-template/-/archive/main/nitkc-graduation-latex-template-main.tar?ref_type=heads)  
GitHub からダウンロード
[zip](https://github.com/somando/NITKC-Graduation-LaTeX-Template/archive/refs/heads/main.zip)

## コンパイル方法

本リポジトリの使用時は以下の拡張機能をインストールすることを推奨します。

- [Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave&ssr=false#review-details)
  - ファイル保存時に指定したコマンドを自動で実行できる VS Code 拡張
  - 保存のたびに LaTeX ビルドを走らせる用途などに使う
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
  - プロジェクト内でのインデントや改行などの書式ルールを統一するための拡張
  - 環境が違っても同じ書式で編集できる
- [vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)
  - VS Code 内で PDF をプレビューできる拡張
  - LaTeX の出力結果をすぐ確認できる。

### ローカル環境

以下の手順で実行するには、ローカル環境に Docker 環境がセットアップされている必要があります。  
Docker を使用せず、 LaTeX の実行環境でコンパイル[^compile]することも可能です。

[^compile]: コンパイル（ compile ）: ソース（ .tex など）から PDF のような最終成果物を生成する処理。

#### Docker 環境で LaTeX ファイルビルド

以下のコマンドを実行して、 `main.tex` ファイルをコンパイルします。  
コンパイルしたアーティファクトは `outputs` ディレクトリに出力されます。

``` bash
docker compose up
```

初回実行時には Docker イメージのビルドを行うため、数分ほど時間がかかります。  
[Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave&ssr=false#review-details) がインストールされている場合、ファイル保存時に自動でコンパイルが行われます。

### リモート環境

本プロジェクトでは、 GitHub Actions と GitLab CI[^gitlab-ci] 双方の CI スクリプトを用意しています。
使用しているリモート環境に応じて使用してください。  
アーティファクト[^artifact]として PDF ファイルが出力されます。

[^gitlab-ci]: GitLab CI : GitLab に組み込まれた CI 機能。 GitHub Actions と同様に、リポジトリ更新に合わせた自動ビルド等ができる。

[^artifact]: アーティファクト（ artifact ） : ビルドや CI の結果として生成される成果物ファイル。

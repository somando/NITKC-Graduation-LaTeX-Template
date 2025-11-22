# GitHubを使用したセットアップ方法

> [!TIP]
> GitLab を使用することでテンプレート更新時の反映を簡単に行うことが可能です。  
> GitLab をリモートリポジトリに使用することを推奨します。

GitHub で Private リポジトリ[^private-repository]として管理したい場合は、以下の手順でリポジトリを作成してください。

[^private-repository]: Private （プライベート）リポジトリ: 作成者や招待されたメンバーだけが閲覧・編集できる非公開のリポジトリ設定。検索結果や第三者からは見えない。

また、 GitHub を使用する場合は、 GitHub Actions の不必要な実行を避けるため、フォーク後、 `.github/workflows/sync-repositories.yml` を削除する必要があります。

## 条件

- GitHub のアカウント作成済み
- SSH キーを GitHub に追加済み
- 既にローカル環境において、 Git をインストール済み
- ( Docker を使用してコンパイルを行う場合) 既にローカル環境において、 Docker をインストール済み

## 手順

### リポジトリ作成手順

以下の手順で実行するには、ローカル環境に Git がセットアップされており、使用するサービスに SSH キーが設定されている必要があります。  
※ SSH が使えない場合は HTTPS URL[^https-url] に読み替えてください。

1. [GitHub 上のテンプレートリポジトリ[^template-repository]](https://github.com/somando/NITKC-Graduation-LaTeX-Template) にアクセスする
2. 画面右上、緑色の「Use this template[^use-this-template]」をクリックし、「Create a new repository[^create-a-new-repository]」にアクセスする
3. 各入力項目を修正する

   | 項目名 | 用途 | 推奨値 |
   | --- | --- | --- |
   | Start with a template | 使用するテンプレート | somando/NITKC-Graduation-LaTeX-Template |
   | Include all branches | 全てのブランチを含めるか | どちらでも可 |
   | Owner[^owner] | オーナーに指定するユーザー / オーガナイゼーション | 自分のユーザーID |
   | Repository name | 作成するリポジトリ名（同一オーナー内で一意） / クローン時のディレクトリ名 | 特になし |
   | Description | プロジェクトの説明（日本語可） | 特になし |
   | Choose visibility | フォーク先に含めるブランチ | **Private** |

4. 項目編集後に「Create repository」ボタンをクリック
5. プロジェクト作成後、リダイレクトを待つ
6. 緑色で表示されている「コード」をクリックし、 「SSH」を選択し、下に表示される `git@github.com:<owner>/<repository_name>.git` をコピーする
7. ローカル環境でプロジェクトを作成したいディレクトリをターミナルで開き、以下のコマンドを実行する

   ``` bash
   git clone <コピーしたSSHリモートURL (git@github.com:<owner>/<repository_name>.git)>
   cd <repository_name>
   ```

8. 不要な GitHub Actions を削除する

   > [!WARNING]
   > このファイルを削除しない限り、 GitHub Actions 実行は毎回 失敗と表示されます。

   ``` bash
   rm .github/workflows/sync-repositories.yml
   ```

9. ( Docker を使用してコンパイルを行う場合) LaTeX 編集後に以下のコマンドを実行することで、 `outputs/main.pdf` が生成される

   ``` bash
   docker compose up
   ```

   初回実行時には Docker イメージのビルドを行うため、数分ほど時間がかかります。

[^https-url]: HTTPS URL : Web の暗号化通信（ HTTPS ）を使ってリポジトリにアクセスするための URL 。 SSH キーが使えない環境でも、ユーザー名とパスワード / トークン認証でクローンや push ができる。

[^template-repository]: テンプレートリポジトリ（ template repository ）: 同じ構成の新しいリポジトリを簡単に作るための雛形として指定されたリポジトリ。

[^use-this-template]: Use this template : GitHub でテンプレートリポジトリを元に、新規リポジトリを作成するための機能。履歴を引き継がず、内容だけをコピーして開始できる。

[^create-a-new-repository]: Create a new repository : テンプレートから実際に新しいリポジトリを生成する操作画面（リポジトリ作成フロー）を指す。

[^owner]: Owner （オーナー） /  Organization （オーガナイゼーション）: リポジトリを所有する主体。個人アカウント（ユーザー）か、チーム・団体アカウント（ Organization ）を指定する。

> [!WARNING]
> テンプレート変更時に GitHub 上に「Sync fork[^sync-fork]」ボタンは表示されません。  
> 更新は以下の [テンプレート更新時に変更を取り込む](#テンプレート更新時に変更を取り込む) を参考にしてください。
>
> テンプレート更新は逐一確認することをおすすめします。

[^sync-fork]: Sync fork : GitHub でフォークしたリポジトリを本家の最新状態にワンクリックで追従させるための UI 機能。テンプレートから作成したリポジトリには通常表示されない。

### テンプレート更新時に変更を取り込む

以下の手順を実行することで、テンプレートリポジトリに変更があった場合に取り込むことができます。

#### （初回のみ） upstream[^upstream] リポジトリを設定する

[^upstream]: upstream （アップストリーム）: 自分が作ったリポジトリの“元になった本家側リポジトリ”を指す呼び方。テンプレートやフォーク元の更新を取り込む際に使う。

1. upstream リポジトリをリモート[^remote]リポジトリに設定する

   以下のコマンドを実行することで、リモート名: `upstream` にテンプレートリポジトリを追加します。

   ``` bash
   git remote add upstream git@github.com:somando/NITKC-Graduation-LaTeX-Template.git
   ```

2. 設定の状況を確認する

   `git remote -v` 実行時に以下のような出力が得られれば成功です。

   ``` bash
   $ git remote -v
   origin  git@github.com:<YOUR_USERNAME>/<YOUR_REPOSITORY>.git (fetch)
   origin  git@github.com:<YOUR_USERNAME>/<YOUR_REPOSITORY>.git (push)
   upstream        git@github.com:somando/NITKC-Graduation-LaTeX-Template.git (fetch)
   upstream        git@github.com:somando/NITKC-Graduation-LaTeX-Template.git (push)
   ```

[^remote]: remote （リモート）: Git で、ネット上など PC 外部にあるリポジトリの参照先。 origin や upstream のように名前を付けて管理する。

#### （更新時に実行） upstream から更新を取り込む

以下のコマンドを実行して、テンプレートリポジトリから変更を取り込みます。

1. テンプレートリポジトリに変更を取得する

   以下のコマンドを実行し、テンプレートリポジトリの変更を fetch[^fetch] します。

   ``` bash
   git fetch upstream
   ```

2. （他ブランチ[^branch]で作業を行っている場合）作業ブランチを `main` ブランチ[^main-branch]に切り替える

   以下のコマンドを実行し、作業ブランチを `main` ブランチに切り替えます。  
   別のブランチで作業していた際にブランチを切り替えるには、全ての変更をコミット[^commit]している必要があります。

   ``` bash
   git checkout main
   ```

3. テンプレートリポジトリの `main` ブランチと作業ブランチをマージ[^merge]する

   以下のコマンドを実行し、テンプレートリポジトリの `main` ブランチと作業ブランチをマージします。

   ``` bash
   git merge upstream/main
   ```

4. Private リポジトリにプッシュ[^push]する

   以下のコマンドを実行し、 Private リポジトリにプッシュします。

   ``` bash
   git push origin main
   ```

[^fetch]: fetch （フェッチ）: リモート側の最新の変更履歴を“手元にダウンロードするだけ”の操作。作業中のブランチにはまだ反映しない。

[^branch]: ブランチ（ branch ）: 同じリポジトリ内で作業履歴を分岐させる仕組み。複数の作業を並行して進め、後で統合できる。

[^main-branch]: main ブランチ: そのリポジトリの中心となる標準ブランチ名。最終成果が集約される“本線”として扱われることが多い。

[^commit]: commit （コミット）: 変更内容をひとまとまりの履歴として確定し、 Git の履歴に記録する操作。ブランチ切替やマージ前の“保存ポイント”になる。

[^merge]: merge （マージ）: 別のブランチの変更を現在のブランチに統合する操作。テンプレート側の更新を自分の作業ブランチへ取り込むときに使う。

[^push]: push （プッシュ）: 手元のブランチの変更履歴を、リモートリポジトリへ送信して反映させる操作。

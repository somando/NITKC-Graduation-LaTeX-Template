# GitHubを使用したセットアップ方法

> [!TIP]
> GitLabを使用することでテンプレート更新時の反映を簡単に行うことが可能です。  
> GitLabをリモートリポジトリに使用することを推奨します。

GitHubでPrivateリポジトリとして管理したい場合は、以下の手順でリポジトリを作成してください。

また、GitHubを使用する場合は、GitHub Actionsの不必要な実行を避けるため、フォーク後、 `.github/workflows/sync-repositories.yml` を削除する必要があります。

## リポジトリ作成手順

以下の手順で実行するには、ローカル環境にGitがセットアップされており、使用するサービスにSSHキーが設定されている必要があります。  
※ SSHが使えない場合はHTTPS URLに読み替えてください。

1. [GitHub 上のテンプレートリポジトリ](https://github.com/somando/NITKC-Graduation-LaTeX-Template) にアクセスする
2. 画面右上、緑色の「Use this template」をクリックし、「Create a new repository」にアクセスする
3. 各入力項目を修正する

   | 項目名 | 用途 | 推奨値 |
   | --- | --- | --- |
   | Start with a template | 使用するテンプレート | somando/NITKC-Graduation-LaTeX-Template |
   | Include all branches | 全てのブランチを含めるか | どちらでも可 |
   | Owner | オーナーに指定するユーザー / オーガナイゼーション | 自分のユーザーID |
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

   ``` bash
   rm .github/workflows/sync-repositories.yml
   ```

9. (Dockerを使用してコンパイルを行う場合) LaTeX編集後に以下のコマンドを実行することで、 `outputs/main.pdf` が生成される

   ``` bash
   docker compose up
   ```

   初回実行時には Docker イメージのビルドを行うため、数分ほど時間がかかります。

## テンプレート更新時に変更を取り込む

以下の手順を実行することで、テンプレートリポジトリに変更があった場合に取り込むことができます。

### （初回のみ）upstreamリポジトリを設定する

以下のコマンドを実行することで、テンプレートリポジトリをupstreamリモートに追加します。

``` bash
git remote add upstream git@github.com:somando/NITKC-Graduation-LaTeX-Template.git
```

`git remote -v` 実行時に以下のような出力が得られれば成功です。

``` bash
$ git remote -v
origin  git@github.com:<YOUR_USERNAME>/<YOUR_REPOSITORY>.git (fetch)
origin  git@github.com:<YOUR_USERNAME>/<YOUR_REPOSITORY>.git (push)
upstream        git@github.com:somando/NITKC-Graduation-LaTeX-Template.git (fetch)
upstream        git@github.com:somando/NITKC-Graduation-LaTeX-Template.git (push)
```

### （更新時に実行）upstreamから更新を取り込む

以下のコマンドを実行して、テンプレートリポジトリから変更を取り込みます。

``` bash
git fetch upstream       # テンプレートリポジトリの変更を取得する
git checkout main        # mainブランチに移動する
git merge upstream/main  # テンプレートリポジトリのmainブランチとローカルのmainブランチをマージする
git push origin main     # Privateリポジトリにpushする
```

> [!WARNING]
> テンプレート変更時に GitHub 上に「Sync fork」ボタンは表示されません。  
> テンプレート更新は逐一確認することをおすすめします。

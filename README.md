# Graduation LaTeX Template

## 使い方

### ローカル環境

本プロジェクトを使用するにはDocker環境がセットアップされている必要があります。

1. `entrypoint.sh`に実行権限を付与する
   
   以下のコマンドを実行して、実行権限を付与します。

   ``` bash
   chmod +x entrypoint.sh
   ```

   この操作はプロジェクトセットアップ時にのみ必要です。

2. Docker環境でLaTeXファイルをビルドする
   
   以下のコマンドを実行して、`main.tex`ファイルをコンパイルします。
   
   コンパイルしたアーティファクトは`outputs`ディレクトリに出力されます。

   ``` bash
   docker compose up
   ```

### リモート環境

本プロジェクトでは、GitHub ActionsとGitLab CI双方のCIスクリプトを用意しています。

使用しているリモート環境に応じて使用してください。

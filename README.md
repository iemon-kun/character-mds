# Character MDS

Gemini CLI のキャラクター（人格）設定を管理するためのプロジェクトです。
このプロジェクトを使うことで、CLIエージェントのペルソナを動的に切り替えることができます。

## 🚀 使い方

キャラクターを切り替えるには、`change_character.sh` スクリプトを使用します。

```bash
./change_character.sh <キャラクター名>
```

`<キャラクター名>` には、`characters/` ディレクトリ内に存在するファイル名を、拡張子なしで指定してください。

### 使用例

`castoria` に切り替える場合：
```bash
./change_character.sh castoria
```

`sota` に切り替える場合：
```bash
./change_character.sh sota
```

このスクリプトを実行すると、`GEMINI.md` というファイルが、指定したキャラクターの定義ファイルへのシンボリックリンクとして更新されます。

## ✨ 新しいキャラクターの追加方法

1.  **マークダウンファイルの作成**
    `characters/` ディレクトリに、新しいキャラクターの `.md` ファイルを作成します。（例： `characters/new_character.md`）

2.  **キャラクターの定義**
    既存のファイル（`castoria.md` や `sota.md`）の形式に倣って、新しいキャラクターの性格、制約事項、トークサンプルなどを記述してください。

3.  **キャラクターの切り替え**
    作成したファイル名を指定して、スクリプトを実行します。
    ```bash
    ./change_character.sh new_character
    ```
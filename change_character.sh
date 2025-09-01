#!/bin/bash

#----------------------------------------------------
# キャラクター切り替え用スクリプト
#
# 使い方:
# ./change_character.sh <キャラクター名>
# 例: ./change_character.sh castoria
#
# キャラクター名は characters/ ディレクトリ内の .md ファイル名に対応
#----------------------------------------------------

# --- 変数設定 ---
CHARACTER_NAME=$1
CHARACTER_DIR="characters"
GEMINI_FILE="GEMINI.md"

# 引数の有無をチェック
if [ -z "$CHARACTER_NAME" ]; then
    echo "エラー: キャラクター名が指定されていません。"
    echo "使い方: ./change_character.sh <キャラクター名>"
    exit 1
fi

# キャラクター設定ファイルの存在チェック
CHARACTER_PATH="$CHARACTER_DIR/$CHARACTER_NAME.md"
if [ ! -f "$CHARACTER_PATH" ]; then
    echo "エラー: '$CHARACTER_PATH' ファイルが見つかりません。"
    echo "characters ディレクトリ内のファイル名を確認してください。"
    exit 1
fi

# 既存のGEMINI.mdを削除（シンボリックリンクまたは通常ファイル）
if [ -L "$GEMINI_FILE" ] || [ -f "$GEMINI_FILE" ]; then
    rm "$GEMINI_FILE"
fi

# 新しいシンボリックリンクを作成
if ! ln -s "$CHARACTER_PATH" "$GEMINI_FILE"; then
    echo "エラー: シンボリックリンクの作成に失敗しました。"
    exit 1
fi

echo "✅ キャラクターを '$CHARACTER_NAME' に切り替えました。"
echo "これで Gemini CLI を実行できます。"

# 切り替え後のgemini.mdの内容を確認したい場合
# (オプション)
# cat "$GEMINI_FILE"
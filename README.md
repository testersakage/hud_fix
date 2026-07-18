# HUD Fix for Luanti (Minetest)

<img width=413, height=136, src="https://github.com/testersakage/hud_fix/blob/main/screenshots/hud_fix.png"></img>

[English Documentation (README_en.md)](./README_en.md)


Luanti（旧Minetest）において、複数のModが画面左下の同じ位置にHUD（情報表示）を配置して重なってしまう現象を解消・調停するModです。
デフォルトでは、領域保護系Modの **「Areas」** と **「Protector Redo」** のテキストが完全に重なってしまう問題を解決します。

## ✨ 主な機能

- **レイアウトの自動調停**: 
  画面最下部（1行目）に「Protector Redo」の情報を固定し、その1行上のスペースから「Areas」の保護エリアリストを表示するように配置を固定します。「Areas」の行数が変動しても下の表示を潰しません。
- **ゲーム内設定に対応**:
  Luantiのメニューから、ピクセル単位での表示位置の微調整や、テキストの表示色を自由に変更可能です。
- **セーフティ設計**:
  各Modの本体コードを直接書き換えない（パッチを当てない）仕組みのため、対象Modがアップデートされても設定がリセットされる心配がありません。

## ⚙️ 設定方法

Luantiのメインメニューから **「設定 (Settings)」** ＞ **「コンテンツ:MOD (Content: Mods)」** ＞ **`hud_fix`** を選択することで、以下の項目をカスタマイズできます。

| 設定項目 | 内容 | 初期値 |
| :--- | :--- | :--- |
| **Protector X Offset** | Protectorの左右位置（ピクセル単位） | `8` |
| **Protector Y Offset** | Protectorの上下位置（ピクセル単位） | `-20` |
| **Protector HUD Color** | Protectorのテキスト色（16進数カラーコード） | `#FFFF22` |
| **Areas X Offset** | Areasの左右位置（ピクセル単位） | `5` |
| **Areas Y Offset** | Areasの上下位置（ピクセル単位） | `-45` |
| **Areas HUD Color** | Areasのテキスト色（16進数カラーコード） | `#FFFFFF` |

*※設定を変更した後は、一度ワールドに入り直すか、ゲームを再起動すると反映されます。*

## 📦 導入方法

1. このリポジトリからソースコードをダウンロードします。
2. フォルダ名を `hud_fix` に変更します。
3. Luantiの `mods` フォルダ（またはワールドの `worldmods` フォルダ）に配置します。
4. ゲーム起動時にModを **有効 (Enable)** に設定してください。

## 依存関係 (Dependencies)

- **必須**: なし (Optional Depends 経由で動作するため、単体で導入してもエラーになりません)
- **対応Mod**: `areas`, `protector` (Protector Redo)

## 📄 ライセンス (License)

このプロジェクトは **MIT License** のもとで公開されています。詳細は [LICENSE](LICENSE) ファイルをご覧ください。

AI生成:このパッケージにはAI生成のアセットまたはコードが含まれています

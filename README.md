# HUD Fix for Luanti (Minetest)

<img width=384, height=176, src="https://github.com/testersakage/hud_fix/blob/main/screenshots/hud_fix.png"></img>

[English Documentation (README_en.md)](./README_en.md)

Luanti（旧Minetest）において、複数のModが画面左下の同じ位置にHUD（情報表示）を配置して重なってしまう現象を解消・調停するModです。
3つの主要な領域保護系Modのテキストを画面左下に美しく集約し、縦一列に整列させます。

## ✨ 主な機能

- **3大Modのレイアウト完全調停**: 
  デフォルトではバラバラだった表示位置を左下に統一し、下から以下の順番で綺麗に積み重ねて表示します。
  1. **Protector Redo**（最下段 / 1行表示）
  2. **Chunk Protection**（中段 / 2行表示）
  3. **Areas**（上段 / 行数可変。一番上に配置することで、エリア数が増えても下の表示を潰しません）
- **ゲーム内設定に対応**:
  Luantiのメニューから、各Modごとにピクセル単位での表示位置の微調整や、テキストの表示色を自由に変更可能です。
- **セーフティ設計**:
  各Modの本体コードを直接書き換えない（パッチを当てない）仕組みのため、対象Modがアップデートされても設定がリセットされる心配がありません。

## ⚙️ 設定方法

Luantiのメインメニューから **「設定 (Settings)」** ＞ **「コンテンツ:MOD (Content: Mods)」** ＞ **`hud_fix`** を選択することで、以下の項目をカスタマイズできます。

| 設定項目 | 内容 | 初期値 |
| :--- | :--- | :--- |
| **Protector X Offset** | Protectorの左右位置（ピクセル単位） | `8` |
| **Protector Y Offset** | Protectorの上下位置（ピクセル単位） | `-20` |
| **Protector HUD Color** | Protectorのテキスト色 | `#FFFF22` |
| **Chunk Protect X Offset** | Chunk Protectionの左右位置（ピクセル単位） | `8` |
| **Chunk Protect Y Offset** | Chunk Protectionの上下位置（ピクセル単位） | `-40` |
| **Chunk Protect HUD Color** | Chunk Protectionのテキスト色 | `#FFFFFF` |
| **Areas X Offset** | Areasの左右位置（ピクセル単位） | `5` |
| **Areas Y Offset** | Areasの上下位置（ピクセル単位） | `-85` |
| **Areas HUD Color** | Areasのテキスト色 | `#FFFFFF` |

*※設定を変更した後は、一度ワールドに入り直すか、ゲームを再起動すると反映されます。*

## 📦 導入方法

1. このリポジトリからソースコードをダウンロードします。
2. フォルダ名を `hud_fix` に変更します。
3. Luantiの `mods` フォルダ（またはワールドの `worldmods` フォルダ）に配置します。
4. ゲーム起動時にModを **有効 (Enable)** に設定してください。

## 依存関係 (Dependencies)

- **必須**: なし (Optional Depends 経由で動作するため、対象Modが揃っていなくてもエラーになりません)
- **対応Mod**: [`Areas`](https://github.com/minetest-mods/areas/), [`Protector`](https://codeberg.org/tenplus1/protector) (Protector Redo), [`chunk_protect`](https://content.luanti.org/packages/Simon/chunk_protect/) (Chunk Protection)

## 📄 ライセンス (License)

このプロジェクトは **MIT License** のもとで公開されています。

AI生成:このパッケージにはAI生成のアセットまたはコードが含まれています

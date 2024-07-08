## Reactの特徴
- コンポーネントベースのアーキテクチャ

> コンポーネント  
UIの一部分をカプセル化したもの。  
HTMLのように扱える。 
各コンポーネントは特定の機能を持つ独立したユニット。  

### コンポーネントの特徴  
- カプセル化
    - 各コンポーネントは、自身の状態（state）と振る舞い（behavior）を内包し(持っていて)、外部から直接変更されない。  
    (コンポーネント間の依存関係が減り、再利用性とテスト性が向上)
- 再利用性
    - 独立性  
    カプセル化により、コンポーネントが他の部分と独立して動作。他の部分に依存しないため、異なる場所で何度も利用可能
    - 再利用により、コードの重複回避、開発時間の短縮、開発効率を向上できる
- 分離性
    - コンポーネントは他の部分と独立している為、変更が他の部分に影響を与えない(少なくなる)
    - UIの一貫性が保たれる  
    (再利用により、UXが向上、バグ減少につながる)
    - アプリケーションの保守性の向上  
    (独立したコンポーネントの使用で、特定部分の修正やアップデートが容易に)

### Reactの主な利点
- コンポーネントの再利用性
- 大規模なコミュニティとエコシステム
- React Hooks

## Type Scriptとは
- 静的型付け言語  
  明示的に型を指定  

  JavaScriptは「動的型付け言語」に分類  
  変数の値 に基づいて、変数 にデータ型 を割り当て
- JavaScriptとの互換性  
  既存のJavaScriptのコードやライブラリをそのまま利用可能
  JavaScriptに変換（トランスパイル）可能
- ツールのサポート  
  コンパイル時にエラーを検出することで、バグの早期発見や開発コストを下げることが可能

### TypeScriptの利点
- エラーの早期発見
- 大規模開発の容易さ
- 改良されたコード編集体験

---

ビューのdiv要素にid  
このdiv要素にReactをマウントして表示する
```
<div class="flex h-[93%] flex-col bg-base-200" id="todo_app"></div>
```
app/javascriptディレクトリ内にreactディレクトリを作成

```javascript:entrypoints/todo_app.tsx
import React from "react"; 
      // Reactライブラリをインポート

import { createRoot } from "react-dom/client";
      // 以前の方法 (ReactDOM.render) Reac17まで
      // 新しい方法 (createRoot) React18~
      // Reactの新しいレンダリングAPIをインポート
      //createRootを使って、ReactコンポーネントをHTMLにマウントする
import TodoApp from "../features/todos";
      // TodoAppコンポーネントをインポート
      // 任意のReactコンポーネント

// 1. HTMLファイルの中の要素を取得
const container = document.getElementById("todo_app");

// 2. 取得した要素を使ってReactのルートを作成
if (container) {
  const root = createRoot(container);

// 3. Reactコンポーネントをレンダリング（表示）
  root.render(<TodoApp />);
}
```
メモ  
Reactのライブラリのインポート  
createRootを使えるようにする  
マウントするReactファイルをインポート  
↓  
マウントさせたい要素(id)を変数に入れる  
変数を使ってルートを作成  
マウントするReactファイルを、作ったルートにレンダリング？  

---

### React HooksのuseState機能
> useStateは、Reactの状態管理機能の一部で、コンポーネント内でデータの状態を持ち、それを更新する機能を提供する

ReactのuseStateフックを使用して、
アプリケーションの状態（state）を管理  

> フック(関数コンポーネント)とは？  
フック (hook) は React 16.8 で追加された新機能。state などの React の機能を、クラスを書かずに使えるようになる。useState, useEffect, useContextなどがある。

```
const [items, setItems] = useState<Item[]>(initialItems);
```
- itemsという名前の状態を作成   
- countならsetCount、priceならsetPriceといったように、  
set〇〇とキャメルケースで書くのが慣習  
- setCountは関数  
- useStateは二つの要素を持った配列を返す  
- useState()の()は初期値   
itemsは初期値としてinitialItemsのデータをもち、  
この状態を更新するためにsetItems関数が用意されている  

<Item[]>はTypeScriptの型注釈であり、  
これによりitems配列の各要素がItem型であることを示している  

型定義とは？
> TypeScriptはitems配列の各要素がどのようなプロパティを持つべきかを理解し、型安全を提供する

```typescript:features/todos/types/index.ts
export interface Item {
  id: number;
  title: string;
  content: string;
  category: string;
  assignee: string;
  position: number;
  category_id: number;
}
```
これらの型をimportして使用  
```import { Item, Category } from "./types"; ```

#### 「interface」と「type」の違い

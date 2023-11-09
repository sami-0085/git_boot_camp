## GitBootCamp
マークダウン記法練習
草ははやせるようになりたいな〜
頑張るぞ〜〜
gitの使い方を勉強中
草生やすぞ！！

#issue2
マイグレーションとは マイグレーションファイル を元に テーブル操作 を行う仕組みです。
マイグレーションファイルとは、Rubyで書かれた テーブルの設計図 のことです。
テーブルの設計図とは カラム や データ型 の定義が書かれた状態のことを指します。

#issue5
resouces :posts do
 resouces :comments
 end
end

post_comments GET posts/post_id/comments posts/commnets#index

のようにidが2つ付く

resouces :posts do
 resouces :comments, shallow: true
 end
end

post_comments GET posts/post_id/comments comments#index
comment GET comment/:id comments#show

index,new,create(commentのid指定しない)
は親(post)のidが必要
edit,show,update,destroy
はcommentのidで一意性を持てるのでboardのid不要

null: false は値が必ず存在するということ
FactoryBot.define do
    factory :article do
      sequence(:title) { |n| "title-#{n}" }
      sequence(:slug) { |n| "slug-#{n}" }
      category
    end

# Articleはbelongs_to authorという関係を持っている
# だから、記事を作成したときに、紐づいた著者も一緒に作成したい
trait :with_author do
# 著者作成に必要なものを確認してtransient作成
  transient do
    sequence(:author_name) { |n| "test_author_#{n}" }
    sequence(:author_slug) { |n| "test_author_slug_#{n}" }
  end
# transientで定義したauthorをbuild(作成)し、生成されているarticleに、紐づける
# 「eveluator.author_name」や、
# 「eveluator.author_slug」には、transientで作成した「test_author_1」みたいなのが入っている
  after(:build) do |article, eveluator|
    artcle.author = build(:author, name: eveluator.author_name, slug: eveluator.author_slug)
  end
end
# Articleは、has_many :tags, through: :article_tags　の関係を持つ
# 記事作成した時に、紐づいたタグを一緒に作成したい
# tag作成に必要なものはnameとslug（ブラウザでタグ新規作成ページを見ると）
# 今回はspec/factories/tags.rbをコピーして書き換え(:tag_name、:tag_slug)
trait :with_tag do
    transient do
      sequence(:tag_name) { |n| "test_tag_name_#{n}" }
      sequence(:tag_slug) { |n| "test_tag_slug_#{n}" }
    end
# 「article.tags <<」で 中間テーブルに対応するレコードも自動的に作成して関連付けられる 
# 「<<」はアソシエーションのメソッド
    after(:build) do |article, eveluator|
        article.tags << build(:tag, name: eveluator.tag_name, slug: eveluator.tag_slug)
    end
end

まとめ

trait 使いたいパーツの名前を定義。FactoryBotで使いたい特定の属性や関連をまとめる
FactoryBotで特定の属性や関連をまとめて名前付けすることにより、繰り返し使えるようにしたパーツ。

transient 具体的な処理の内容。FactoryBotで一時的に使う属性を定義
transient はFactoryBot内でのみ使われる一時的な属性を定義するためにある。

after(:build) FactoryBotのコールバック。
systemspecなどでインスタンスが作られた時（今回ならarticleインスタンス）、同時に作られる。
after(:build) はインスタンスがビルドされた直後に実行されるコールバックで、SystemSpecでインスタンスが作られる際にも使用される。
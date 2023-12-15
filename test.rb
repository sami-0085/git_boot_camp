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
# 「article.tags <<」で 中間テーブル article_tags に対応するレコードも自動的に作成して関連付けられる 
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

復習
ArticleインスタンスをfactoryBotで作成時に、一緒に紐づけられたsentenseも作られるようにtraitを作りたい。

trait :with_sentence do
  transient do
    sequence(:sentence_body) { |n| "test_article_body_#{n}" }
  end
# 「article.sentences <<」で 中間テーブルに対応するレコードも自動的に作成して関連付けられる 
# 「<<」はアソシエーションのメソッド

  after(:build) do |artile, eveluator|
    artcle.sentences << create(:sentence, body: eveluator.sentence_body)
  end
end

(修正)<< create ではなく =build にしてしまった
(原因)今回作るsentence と Articleモデルとの関係を考え忘れた。
なんでafter(:build)なのにcreateなんだろう？
->create: 新しくオブジェクトをメモリ上に作成して、DBに保存
->build: オブジェクトはメモリ上だけに作成、DBには保存されない
(結論)テストデータなんだから、buildで良くない？メモリはテストが終わったらガベージコレクション(GC)に削除されるらしい。
基本buildでOK! DBに保存する流れをテストしたいときはcreate!

いよいよsystemspecを作りたい

RSpec.describe 'AdminArticles', type: :system do
  let(:admin) { create :user, :admin }
  let(:draft_article) { create :article, :draft }
  let(:future_article) { create :article, :future }
  let(:past_article) { create :article, :past }
  before do
    login(admin)
  end

  describe '検索機能' do
    let(:article_with_author) {create(:article, :with_author, author_name: '伊藤')}
    let(:article_with_author) {create :article, :with_author, author_name: '伊藤'}
# 上記2つはどちらでも良い。

    it '著者名をセレクトボックスで選択して検索ができること' do
    
    end

    it 'タグをセレクトボックスで選択して検索ができること' do

    end

    it '記事内容がフリーワード検索できること' do

    end

    it '下書き状態の記事について、記事内容がフリーワード検索できること'

    end
  end
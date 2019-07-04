# README

## アプリケーション概要

- 資金預かり型介護事業者のための利用者預り金管理アプリ


## アプリケーションの機能一覧

- ユーザー管理
  - 新規登録／ログイン／ログアウト／ユーザー情報編集機能
- 取引情報
  - 一覧表示／利用者別一覧表示／詳細表示／新規登録／編集／削除機能
- 利用者情報
  - 一覧表示／詳細表示／新規登録／編集／削除機能
- 施設情報
  - 一覧表示／詳細表示／新規登録／編集／削除機能
#### 特に工夫した点
- 取引登録画面にて科目コード3桁を入力すると科目名が表示される
- 取引登録画面にてEnterキーでTabキーと同様項目移動ができる
- 利用者登録画面にてアップロード画像のプレビューが表示される
- 利用者別取引一覧画面にて利用者の残高が表示される
  （取引新規登録／編集時に別テーブルの残高にも同時反映させた）


## アプリケーション内で使用している技術一覧
|種別|名称|
|------|----|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.2.2.1)|
|マークアップ|HTML(Haml),CSS(Sass)|
|フロントエンド|JavaScript(jQuery)|
|DB|MySQL|
|本番環境|AWS EC2|
|画像アップロード|carrierwave, AWS S3|
|自動デプロイ|capistrano|
|ユーザー管理|devise|
|パンくず表示機能|gretel|


## データベース

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|kana|string|null: false|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|


#### Association
- has_many :transactions


#### add_index
- add_index :email, unique: true
- add_index :reset_password_token, unique: true


### transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|ts_number|integer|null: false|
|date|date|null: false|
|customer|references|foreign_key: true|
|subject|references|foreign_key: true|
|amount|integer|null: false|
|institution|references|foreign_key: true|
|summary|text|limit: 100|
|user|references|foreign_key: true|


#### Association
- belongs_to :user
- belongs_to :customer
- belongs_to :subject
- belongs_to :institution, optional: true


### customersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|kana|string|null: false|
|sex|integer|null: false|
|birthday|date||
|image|text||
|phone_number|string||
|cell_phone_number|string||
|emergency_phone_number|string||
|postal_code|string||
|prefecture|refenreces|foreign_key: true|
|city|string||
|address|text||
|building|text||
|start_date|date||


#### Association
- has_many :institutions
- has_many :transactions
- has_one :balance
- accepts_nested_attributes_for :balance
- belongs_to :prefecture


#### add_index
- add_index :customers, :name
- add_index :customers, :kana


### institutionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|kana|string|null: false|
|image|text||
|phone_number_one|string||
|phone_number_two|string||
|postal_code|integer||
|prefecture|references|foreign_key: true, optional: true|
|city|string||
|address|text||
|building|text||
|institution_type|references|foreign_key: true, optional: true|


#### Association
- has_many :customers
- has_many :transactions
- belongs_to :institution_type
- belongs_to :prefecture


#### add_index
- add_index :institutions, :name
- add_index :institutions, :kana


### institution_typesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


#### Association
- has_many :institutions


### subjectsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|status|integer|null: false|
|ancestry|string||
|number|integer|unique: true|


#### Association
- has_many :transactions


#### add_index
- add_index :subjects, :ancestry


### balancesテーブル

|Column|Type|Options|
|------|----|-------|
|customer|references|foreign_key: true|
|balance|integer|null: false|


#### Association
- belongs_to :customer


### prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


#### Association
- has_many :customers
- has_many :institutions

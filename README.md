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

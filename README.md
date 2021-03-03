## アプリケーション名
- aaaaaa


## 概要
- おすすめオンラインゲームの記事を投稿できる
- 投稿された記事にコメントができる
- 投稿された記事にいいねができる
- ユーザーの登録ができる

## 本番環境


## 制作背景（意図）
- 私はPCオンラインゲームが好きなのですが、一番最初にPCを買うときにやりたいオンラインゲームで出来るパソコンはどれだろうかと探すのが大変だった思い出があります。色々なオンラインゲームが載っているサイトなどを見にいった時にオンラインゲームの情報は載っているのですが、おすすめのPC情報なども載っているサイトがないなと思い作りました。

## DEMO
# トップページ
![トップページ画像](02a5fc7fd83ff2cd16bb0c4f3632c5d8.jpg)

## 工夫したポイント
- 投稿された記事にコメントができる
- 投稿された記事にいいねができる
- 記事を見て動画など見たくなったら動画サイトのリンクをつけた
- おすすめのパソコンサイトにいくリンクをつけた

## 使用技術（開発環境）

### バックエンド
Ruby,　Ruby on Rails

### フロントエンド
HTML, CSS

### データベース
MySQL, Sequel Pro

### ソース管理
GitHu, GitHub Desktop

### テスト
Rspec

### エディタ
VSCode

## 課題今後実装したい機能
- いいねの評価機能が同期通信で実装しているのでAjaxで実装
- 記事の検索機能を実装
- 動画を見れる様にAPIで実装
 
## DB設計

### usersテーブル

| Column                 |Type     |Options                    |
|------------------------|---------|---------------------------|
| nickname               | string  | null: false               |
| email                  | string  | null: false               |
| encrypted_password     | string  | null: false               |

### Association
- has_many :game_titles
- has_many :comments
- has_many :favorites, dependent: :destroy


### game_titles テーブル

| Column                 |Type         |Options                    |
|------------------------|-------------|---------------------------|
| gama_title             | string      | null: false               |
| game_info              | text        | null: false               |
| recommended_pc         | text        | null: false               |
| monthly_fee            | string      | null: false               |
| user                   | references  | foreign_key: true         |


### Association
- belongs_to :user
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
  
  
### comments テーブル

| Column                 |Type         |Options                    |
|------------------------|-------------|---------------------------|
| text                   | text        | null: false               |
| user                   | references  | foreign_key: true         |
| game_title             | references  | foreign_key: true         |


### Association
- belongs_to :user
- belongs_to :game_title


### users テーブル

| Column                 |Type     |Options                    |
|------------------------|---------|---------------------------|
| user                   | integer |                           |
| game_title             | integer |                           |



### Association
- belongs_to :game_title
- belongs_to :user

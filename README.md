# デプロイの手順

1. heroku login（ログインをする)  
2. heroku create (Herokuに新しいアプリケーションを作成する）  
3. git add-A（ステージングエリアへ追加）  
4. git commit -m”init”（リポジトリに保存する）  
5. heroku buildpacks:set heroku/ruby （Heroku buildpackを追加する）  
6. heroku buildpacks:add —index 1 heroku/nodejs（Heroku buildpackを追加する）  
7. git push heroku step2:master（デプロイをする）  
8. heroku run rails db:migrate（マイグレーションの実行）  
9. heroku open（アプリケーションにアクセスする）  
***
User
--
| Column   | Type   |
| -------- | ------ |
| name     | string |
| email    | string |
| password | string |

Task
--
| Column   | Type    |
| -------- | ------- |
| title    | string  |
| content  | text    |
| deadline | date    |
| priority | string  |
| status   | string  |
| user_id  | integer |

label
--
| Column  | Type |
| ------- | ---- |
| content | text |

Conect
--
| Column   | Type    |
| -------- | ------- |
| task_id  | integer |
| label_id | integer |

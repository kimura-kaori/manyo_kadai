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

# H1デプロイの手順

heroku login（ログインをする）<br>
heroku create (Herokuに新しいアプリケーションを作成する）<br>
git add-A（ステージングエリアへ追加）<br>
git commit -m”init”（リポジトリに保存する）<br>
heroku buildpacks:set heroku/ruby （Heroku buildpackを追加する）<br>
heroku buildpacks:add —index 1 heroku/nodejs（Heroku buildpackを追加する）<br>
git push heroku step2:master（デプロイをする）<br>
heroku run rails db:migrate（マイグレーションの実行）<br>
heroku open（アプリケーションにアクセスする）

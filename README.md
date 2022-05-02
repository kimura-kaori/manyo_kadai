| デプロイの手順                                              |
| ----------------------------------------------------------- |
| heroku login（ログインをする)                               |
| heroku create (Herokuに新しいアプリケーションを作成する）   |
| git add-A（ステージングエリアへ追加）                       |

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

## ユーザーテーブルの設計のテンプレート

- name
  - 論理名: ユーザー名
  - 型: String
  - デフォルト: なし
  - NULL: false
  - length: 30
  - 重複: 可

- email
    - 論理名: メールアドレス
    - 型: String
    - デフォルト: なし
    - NULL: false
    - length: 255
    - 重複: 可

- password_digest(bcryptの場合必ずこの名前にする)
  - 論理名: パスワード
  - 型: String
  - デフォルト: なし
  - NULL: false
  - length: 72(bcryptの標準バリデーション)
  - 重複: 可

- is_activated
    - 論理名: メール認証フラグ
    - 型: Boolean
    - デフォルト: false
    - NULL: false
    - length: -  
    - 重複: -

- is_admin
    - 論理名: 管理者フラグ
    - 型: Boolean
    - デフォルト: false
    - NULL: false
    - length: -
    - 重複: -

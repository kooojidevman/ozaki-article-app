## ユーザーテーブルの設計のテンプレート

### テーブル設計

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

### バリデーション仕様

- name
  - 入力: 必須
  - 最小文字数: -
  - 最大文字数: 30
  - 書式チェック: しない
  - 一意性: なし

- email
  - 入力: 必須
  - 最小文字数: -
  - 最大文字数: 255
  - 書式チェック: する
  - 一意性: `is_activated = true`の場合はあり

- password_digest
  - 入力: 必須
  - 最小文字数: 8
  - 最大文字数: 255
  - 書式チェック: する
  - 一意性: ない

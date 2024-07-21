# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  is_activated    :boolean          default(FALSE), not null
#  is_admin        :boolean          default(FALSE), not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  # bcrypt:
  # + passwordの暗号化
  # + password_digest -> passwordとして扱える
  # + password_confirmation(仮想属性) -> パスワードの一致確認
  # + 一致バリデーションが自動追加
  # + 最大72文字のバリデーションが自動追加
  # + create時の必須バリデーション自動追加
  # + authenticate(文字列) <- パスワードが一致しているか確認できる
  has_secure_password
end

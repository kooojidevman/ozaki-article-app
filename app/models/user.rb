require 'validator/_email_validator'

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
  before_validation :downcase_email

  # bcrypt:
  # + passwordの暗号化
  # + password_digest -> passwordとして扱える
  # + password_confirmation(仮想属性) -> パスワードの一致確認
  # + 一致バリデーションが自動追加
  # + 最大72文字のバリデーションが自動追加
  # + create時の必須バリデーション自動追加
  # + authenticate(文字列) <- パスワードが一致しているか確認できる
  has_secure_password

  validates :name, presence: true, length: { maximum: 30, allow_blank: true }
  validates :email, presence: true, email: { allow_blank: true }
  # passwordのバリデーション:
  # + 先頭の文字が「a-zA-Z_-」になっている(\A[\w\-])
  # + 必ず1文字以上繰り返す(+)
  # + 文字列の末尾に一致(\z)
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A[\w\-]+\z/, allow_blank: true }, allow_nil: true
  validates :is_activated, inclusion: { in: [true, false] }
  validates :is_admin, inclusion: { in: [true, false] }

  def email_activated?
    users = User.where.not(id:)
    users.find_activated(email).present?
  end

  class << self
    # メール認証が既に済んでいるユーザーをemailで検索して返す
    def find_activated(email)
      find_by(email:, is_activated: true)
    end
  end

  private

  # emailを小文字にする
  def downcase_email
    email&.downcase!
  end
end

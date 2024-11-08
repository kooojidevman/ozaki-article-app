class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # 文字数制限
    max = 255
    record.errors.add(attribute, :too_long, count: max) if value.length > max

    # 書式制限
    format = /\A\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\z/
    record.errors.add(attribute, :invalid) unless format.match?(value)

    # uniqueness(activatedのものは一つだけ)
    record.errors.add(attribute, :taken) if record.email_activated?
  end
end

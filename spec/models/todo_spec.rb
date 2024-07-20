# == Schema Information
#
# Table name: todos
#
#  id         :bigint           not null, primary key
#  title      :text(65535)
#  is_done    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Todo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
